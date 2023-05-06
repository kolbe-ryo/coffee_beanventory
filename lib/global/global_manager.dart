// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/global/global_state.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';

part 'global_manager.g.dart';

@riverpod
class GlobalManager extends _$GlobalManager {
  late final GameWorld _gameWorld;
  GameWorld get world => _gameWorld;

  @override
  GlobalState build() {
    final context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    _gameWorld = GameWorld(mediaQuery: MediaQuery.of(context).size);
    return const GlobalState();
  }

  Future<void> addBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams + grams);
    await _gameWorld.addBeans(grams);
  }

  Future<void> removeBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams - grams);
    await _gameWorld.onRemove();
    await Future<void>.delayed(Duration(milliseconds: grams * 50));
    _gameWorld.onCreate();

    // 1秒後に落下した
    await Future<void>.delayed(const Duration(seconds: 1));
    _gameWorld.onRemoveBeans();
  }
}
