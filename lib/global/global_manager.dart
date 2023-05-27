// Flutter imports:
import 'package:coffee_beanventory/ui/view_model/color_controller_view_model.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/model/coffee_beanventory_model.dart';
import 'package:coffee_beanventory/repository/interface/local_storage_interface.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';
import 'package:coffee_beanventory/util/logger.dart';

part 'global_manager.g.dart';

@riverpod
class GlobalManager extends _$GlobalManager {
  late final GameWorld _gameWorld;
  GameWorld get world => _gameWorld;

  bool _isLoadedLocalStorage = false;
  bool get isLoadedLocalStorage => _isLoadedLocalStorage;

  late ColorControllerViewModel colorControllerViewModel;

  // AsyncValueStateでFutureではないStateを更新するにはrequiredValueを使用する
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
        beanGrams: response.beanGrams,
        beanStockMax: response.beanStockMax,
        beanAddMax: response.beanAddMax,
        addBeans: response.addBeans,
        useBeans: response.useBeans,
      );
      _isLoadedLocalStorage = true;
      logger.info(state);
    } on Exception catch (e) {
      // TODO catch expected Exception
      logger.info(e);
    }
  }

  // Add action by user
  Future<void> addBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams + grams);
    await GetIt.I<LocalStorageInterface>().save(state);
    await _gameWorld.addBeans(grams);
  }

  // Change adding bean by user
  void changeAddBeans(int grams) => state = state.copyWith(addBeans: grams);

  // Remove action by user
  Future<void> removeBeanGrams(int grams) async {
    if (state.beanGrams - grams <= 0) {
      return;
    }

    try {
      state = state.copyWith(beanGrams: state.beanGrams - grams, useBeans: grams);
      await GetIt.I<LocalStorageInterface>().save(state);
      await _gameWorld.onRemove();
      await Future<void>.delayed(Duration(milliseconds: grams * 30));
      _gameWorld.onCreateBottomWall();

      // Remove falling beans after 1 second
      await Future<void>.delayed(const Duration(seconds: 1));
      await _gameWorld.onRemoveBeans(remainingBeans: state.beanGrams);
    } on Exception catch (e) {
      // TODO: handle exception
    }
  }

  // Change using bean by user
  void changeUseBeans(int grams) => state = state.copyWith(useBeans: grams);

  Future<void> switchColor() async {
    // Nothing to do if animating
    if (colorControllerViewModel.animationController.isAnimating) {
      return;
    }
    state = state.copyWith(colorIndex: state.colorIndex.switchColorIndex);
    colorControllerViewModel.changeColor();
  }
}
