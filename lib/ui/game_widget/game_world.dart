// Flutter imports:
import 'package:coffee_beanventory/ui/top_page/top_page_view_model.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/game_widget/ball_generator.dart';
import 'package:coffee_beanventory/ui/game_widget/wall.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameWorld extends Forge2DGame with HasTappables {
  GameWorld({
    required this.mediaQuery,
    required this.ref,
  })  : _generator = const BallGenerator(),
        super(zoom: 5);

  final BallGenerator _generator;
  final Size mediaQuery;
  final WidgetRef ref;
  late Component _bottomWall;

  @override
  Color backgroundColor() => Colors.transparent;

  // Getter for coordinates for Walls
  // ================================
  double get _paddingWidth => baseWidthRate * mediaQuery.width;

  double get _bottomCoordinateY => mediaQuery.width * aspectRateOfFlame - _paddingWidth;

  Vector2 get _topLeftCoordinateVector => screenToWorld(
        Vector2(
          _paddingWidth,
          topWorld,
        ),
      );

  Vector2 get _topRightCoordinateVector => screenToWorld(
        Vector2(
          camera.viewport.effectiveSize.x - _paddingWidth,
          topWorld,
        ),
      );

  Vector2 get _bottomLeftCoordinateVector => screenToWorld(
        Vector2(
          _paddingWidth,
          _bottomCoordinateY,
        ),
      );

  Vector2 get _bottomRightCoordinateVector => screenToWorld(
        Vector2(
          camera.viewport.effectiveSize.x - _paddingWidth,
          _bottomCoordinateY,
        ),
      );

  Vector2 get _bottomLeftCenterCoordinateVector => screenToWorld(
        Vector2(
          mediaQuery.width / 3,
          _bottomCoordinateY + _paddingWidth * 0.3,
        ),
      );

  Vector2 get _bottomRightCenterCoordinateVector => screenToWorld(
        Vector2(
          mediaQuery.width * 2 / 3,
          _bottomCoordinateY + _paddingWidth * 0.3,
        ),
      );
  // ================================

  // Initial method
  @override
  Future<void> onLoad() async {
    _generator.generateBalls(30).forEach(add);
    createBoundaries().forEach(add);
    return super.onLoad();
  }

  // Create initial boundaries
  List<Component> createBoundaries() {
    _bottomWall = Wall(_bottomLeftCenterCoordinateVector, _bottomRightCenterCoordinateVector);

    return [
      // Left Wall
      Wall(_topLeftCoordinateVector, _bottomLeftCoordinateVector),
      // Right Wall
      Wall(_topRightCoordinateVector, _bottomRightCoordinateVector),
      // Left Bottom Wall
      Wall(_bottomLeftCoordinateVector, _bottomLeftCenterCoordinateVector),
      // RIght Bottom Wall
      Wall(_bottomRightCenterCoordinateVector, _bottomRightCoordinateVector),
      // Center Bottom Wall
      _bottomWall,
    ];
  }

  // Add bottom layer
  Future<void> onCreate() async {
    final topPageProvider = ref.watch(topPageViewModelProvider);
    if (topPageProvider.valueOrNull?.isRemoveBottomLayer ?? false) {
      return;
    }
    _bottomWall = Wall(_bottomLeftCenterCoordinateVector, _bottomRightCenterCoordinateVector);
    add(_bottomWall);
  }

  // Remove bottom layer
  @override
  Future<void> onRemove() async {
    _bottomWall.onRemove();
  }

  // TODO: 追加時にstateとローカルを更新する
  Future<void> addBalls(int balls) async {
    _generator.generateBalls(balls).forEach(add);
  }
}
