// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/model/coffee_beanventory_model.dart';
import 'package:coffee_beanventory/repository/interface/local_storage_interface.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';
import 'package:coffee_beanventory/ui/view_model/color_controller_view_model.dart';
import 'package:coffee_beanventory/ui/view_model/counter_controller_view_model.dart';
import 'package:coffee_beanventory/util/di.dart';
import 'package:coffee_beanventory/util/logger.dart';

part 'global_manager.g.dart';

@riverpod
class GlobalManager extends _$GlobalManager {
  late final GameWorld _gameWorld;
  GameWorld get world => _gameWorld;

  late ColorControllerViewModel colorControllerViewModel;

  late CounterControllerViewModel counterControllerViewModel;

  // Tips: AsyncValueStateでFutureではないStateを更新するにはrequiredValueを使用する
  @override
  CoffeeBeanventoryModel build() {
    final context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    _gameWorld = GameWorld(mediaQuery: MediaQuery.of(context).size);
    return const CoffeeBeanventoryModel();
  }

  // Fetch from local storage as the initiral action for starting
  Future<void> fetchFromLocalStorage() async {
    try {
      final response = await ref.watch(localStorageInterfaceProvider).fetch();
      state = state.copyWith(
        colorIndex: response.colorIndex,
        coffeeName: response.coffeeName,
        beanGrams: response.beanGrams,
        beanStockMax: response.beanStockMax,
        addBeans: response.addBeans,
        useBeans: response.useBeans,
      );
      logger.info(state);
      await _gameWorld.addBeans(state.beanGrams);
    } on Exception catch (e) {
      // TODO: 取得に失敗した場合、際ローディングにより取得する手段を提供する
      logger.info(e);
    }
  }

  // Save to local storage after some action for changing state
  Future<void> saveToLocalStorage() async {
    await ref.watch(localStorageInterfaceProvider).save(state);
  }

  // Add action by user
  Future<void> addBeanGrams(int grams) async {
    final currentGrams = state.beanGrams + grams;
    var addGrams = grams;

    if (currentGrams >= state.beanStockMax) {
      addGrams = state.beanStockMax - state.beanGrams;
      state = state.copyWith(beanGrams: state.beanStockMax);
    } else {
      state = state.copyWith(beanGrams: state.beanGrams + grams);
    }
    await saveToLocalStorage();

    // Nothing to do if max beans
    if (addGrams == 0) {
      return;
    }
    await _gameWorld.addBeans(addGrams);
  }

  // Remove action by user
  Future<void> removeBeanGrams(int useGrams) async {
    final remainBeans = (state.beanGrams - useGrams >= 0) ? state.beanGrams - useGrams : 0;

    try {
      state = state.copyWith(beanGrams: remainBeans, useBeans: useGrams);
      await saveToLocalStorage();
      await _gameWorld.onRemoveBottom();
      await Future<void>.delayed(
        Duration(milliseconds: _releaseCalculator(useGrams)),
      );
      _gameWorld.onCreateBottomWall();

      // Remove falling beans after 1 second
      await Future<void>.delayed(const Duration(seconds: 2));
      await _gameWorld.onRemoveBeans(remainingBeans: state.beanGrams);

      // Log for checking correct use and remove bean
      logger
        ..info('フカホリ: $useGrams')
        ..info('フカホリ: ${_gameWorld.world.bodies.length - 7}');
    } on Exception catch (error) {
      logger.info(error);
    }
  }

  // TODO: 個数によって、Bottomの開放期間を変更する
  // TODO: または　削除量が足りていない場合はさらに追加でbottomを開放する
  int _releaseCalculator(int grams) {
    return grams * 25;
  }

  // Change adding bean by user
  void changeAddBeans(int grams) => state = state.copyWith(addBeans: grams);
  // Change using bean by user
  void changeUseBeans(int grams) => state = state.copyWith(useBeans: grams);

  // Method for Settings Page
  // ########################################################################

  // Coffee Name
  Future<void> changeCoffeeName(String coffeeName) async {
    state = state.copyWith(coffeeName: coffeeName);
    await saveToLocalStorage();
  }

  // Color Theme
  Future<void> switchColor() async {
    // Nothing to do if animating
    if (colorControllerViewModel.animationController.isAnimating) {
      return;
    }
    state = state.copyWith(colorIndex: state.colorIndex.switchColorIndex);
    colorControllerViewModel.changeColor();
    await saveToLocalStorage();
  }

  // Change Volume
  // TODO change state and setting min(100) and max(300?)
  Future<void> changeVolume({required bool isCountUp}) async {
    // Nothing to do below
    if (isCountUp && state.beanStockMax == maxStorage) {
      return;
    }
    if (!isCountUp && state.beanStockMax == minStorage) {
      return;
    }
    // Set state
    if (isCountUp) {
      state = state.copyWith(beanStockMax: state.beanStockMax + 50);
    } else {
      state = state.copyWith(beanStockMax: state.beanStockMax - 50);
    }
    await saveToLocalStorage();
  }

  // Reset All
  Future<bool> deleteAllSettins() async {
    // Set initializing color if not
    if (colorControllerViewModel.initialColorIndex != state.colorIndex) {
      colorControllerViewModel.changeColor();
    }
    state = CoffeeBeanventoryModel(colorIndex: colorControllerViewModel.initialColorIndex);

    // Remove All beans
    await _gameWorld.onRemoveBottom();
    // TODO　全ての豆の削除に必要な最低限の秒数を算出する（豆の量によって秒数を変更する）
    await Future<void>.delayed(const Duration(seconds: 10));
    _gameWorld.onCreateBottomWall();

    // update state
    await saveToLocalStorage();
    return true;
  }
  // ########################################################################
}
