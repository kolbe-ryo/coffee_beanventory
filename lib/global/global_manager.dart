// Flutter imports:
import 'package:coffee_beanventory/ui/view_model/counter_controller_view_model.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/model/coffee_beanventory_model.dart';
import 'package:coffee_beanventory/repository/interface/local_storage_interface.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';
import 'package:coffee_beanventory/ui/view_model/color_controller_view_model.dart';
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
      final response = await GetIt.I<LocalStorageInterface>().fetch();
      state = state.copyWith(
        colorIndex: response.colorIndex,
        coffeeName: response.coffeeName,
        beanGrams: response.beanGrams,
        beanStockMax: response.beanStockMax,
        beanAddMax: response.beanAddMax,
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
    await GetIt.I<LocalStorageInterface>().save(state);
  }

  // Add action by user
  Future<void> addBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams + grams);
    await saveToLocalStorage();
    await _gameWorld.addBeans(grams);
  }

  // Remove action by user
  Future<void> removeBeanGrams(int useGrams) async {
    final remainBeans = (state.beanGrams - useGrams >= 0) ? state.beanGrams - useGrams : 0;

    try {
      state = state.copyWith(beanGrams: remainBeans, useBeans: useGrams);
      await GetIt.I<LocalStorageInterface>().save(state);
      await _gameWorld.onRemove();
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
    if (isCountUp && state.beanStockMax == 300) {
      return;
    }
    if (!isCountUp && state.beanStockMax == 100) {
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

  // Initialization
  Future<void> deleteAllSettins() async {
    state = const CoffeeBeanventoryModel();
    await saveToLocalStorage();
  }
  // ########################################################################
}
