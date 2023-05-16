// Flutter imports:
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

  Future<void> addBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams + grams);
    await _gameWorld.addBeans(grams);
  }

  void changeAddBeans(int grams) => state = state.copyWith(addBeans: grams);

  void changeUseBeans(int grams) => state = state.copyWith(useBeans: grams);

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
}
