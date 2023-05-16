// Flutter imports:
import 'package:coffee_beanventory/repository/interface/local_storage_interface.dart';
import 'package:coffee_beanventory/util/logger.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/model/coffee_beanventory_model.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';

part 'global_manager.g.dart';

@riverpod
class GlobalManager extends _$GlobalManager {
  late final GameWorld _gameWorld;
  GameWorld get world => _gameWorld;

  @override
  CoffeeBeanventoryModel build() {
    final context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    _gameWorld = GameWorld(mediaQuery: MediaQuery.of(context).size);
    return const CoffeeBeanventoryModel();
  }

  // Fetch from local storage as the initiral action for starting
  Future<CoffeeBeanventoryModel?> _fetchFromLocalStorage() async {
    try {
      final response = await GetIt.I<LocalStorageInterface>().fetch() ?? const CoffeeBeanventoryModel();
      state = state.copyWith(
        colorIndex: response.colorIndex,
        beanGrams: response.beanGrams,
        beanStockMax: response.beanStockMax,
        beanAddMax: response.beanAddMax,
        addBeans: response.addBeans,
        useBeans: response.useBeans,
      );
      logger.info(state);
    } on Exception catch (e) {
      // TODO catch expected Exception
      logger.info(e);
    }
  }

  // Save to local storage after change CoffeeBeanventory Model

  // Add action by user
  Future<void> addBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams + grams);
    await _gameWorld.addBeans(grams);
  }

  // Change adding bean by user
  void changeAddBeans(int grams) => state = state.copyWith(addBeans: grams);

  // Remove action by user
  Future<void> removeBeanGrams(int grams) async {
    if (state.beanGrams - grams <= 0) {
      return;
    }
    state = state.copyWith(beanGrams: state.beanGrams - grams, useBeans: grams);
    await _gameWorld.onRemove();
    await Future<void>.delayed(Duration(milliseconds: grams * 30));
    _gameWorld.onCreateBottomWall();

    // Remove falling beans after 1 second
    await Future<void>.delayed(const Duration(seconds: 1));
    await _gameWorld.onRemoveBeans(remainingBeans: state.beanGrams);
  }

  // Change using bean by user
  void changeUseBeans(int grams) => state = state.copyWith(useBeans: grams);
}