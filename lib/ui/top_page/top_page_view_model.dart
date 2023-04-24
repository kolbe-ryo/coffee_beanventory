// Package imports:
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/ui/top_page/top_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

part 'top_page_view_model.g.dart';

@riverpod
class TopPageViewModel extends _$TopPageViewModel with LocatorMixin {
  late final GameWorld _gameWorld;

  @override
  TopPageState build() {
    final context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    _gameWorld = GameWorld(mediaQuery: MediaQuery.of(context).size);
    return const TopPageState();
  }

  GameWorld get world => _gameWorld;

  // set world(GameWorld world) => _gameWorld = world;

  void switchIsRemoveBottomLayer({required bool isRemove}) => state = state.copyWith(isRemoveBottomLayer: isRemove);

  void addBeanGrams(int grams) {
    state = state.copyWith(beanGrams: state.beanGrams + grams);
    _gameWorld.addBeans(grams);
  }

  Future<void> removeBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams - grams);
    await _gameWorld.onRemove();
    await Future.delayed(Duration(milliseconds: grams * 100));
    _gameWorld
      ..onCreate()
      ..onRemoveBeans();
    switchIsRemoveBottomLayer(isRemove: false);
  }
}
