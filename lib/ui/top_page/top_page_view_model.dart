// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';
import 'package:coffee_beanventory/ui/top_page/top_page_state.dart';

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

  void switchIsRemoveBottomLayer({required bool isRemove}) => state = state.copyWith(isRemoveBottomLayer: isRemove);

  Future<void> addBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams + grams);
    await _gameWorld.addBeans(grams);
  }

  Future<void> removeBeanGrams(int grams) async {
    state = state.copyWith(beanGrams: state.beanGrams - grams);
    await _gameWorld.onRemove();
    await Future<void>.delayed(Duration(milliseconds: grams * 50));
    _gameWorld
      ..onCreate()
      ..onRemoveBeans();
    switchIsRemoveBottomLayer(isRemove: false);
  }
}
