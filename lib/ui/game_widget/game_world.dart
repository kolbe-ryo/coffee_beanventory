// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/game_widget/ball_generator.dart';
import 'package:coffee_beanventory/ui/game_widget/wall.dart';
import 'package:coffee_beanventory/util/logger.dart';

class GameWorld extends Forge2DGame with HasTappables {
  GameWorld({required this.mediaQuery})
      : _generator = BallGenerator(mediaQuery.width),
        super(zoom: gameZoom);

  final BallGenerator _generator;
  final Size mediaQuery;

  late Component _bottomFlameWall;

  static const topWorld = 0.0;
  static const _heightShoulderRate = 0.95;
  static const _heightNeckRate = 1.05;

  @override
  Color backgroundColor() => Colors.transparent;

  // Getter for coordinates for Walls
  // ===============================
  double get _paddingWidth => (mediaQuery.width * (1 - widthRate + 0.05)) / 2;

  double get _bottomCoordinateY => mediaQuery.width * 1.3;

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
          mediaQuery.width * _heightShoulderRate,
        ),
      );

  Vector2 get _bottomRightCoordinateVector => screenToWorld(
        Vector2(
          camera.viewport.effectiveSize.x - _paddingWidth,
          mediaQuery.width * _heightShoulderRate,
        ),
      );

  Vector2 get _slatingLeftVector => screenToWorld(
        Vector2(
          mediaQuery.width * 1 / 3,
          mediaQuery.width * _heightNeckRate,
        ),
      );

  Vector2 get _slatingRightVector => screenToWorld(
        Vector2(
          mediaQuery.width * 2 / 3,
          mediaQuery.width * _heightNeckRate,
        ),
      );

  Vector2 get _bottomLeftCenterCoordinateVector => screenToWorld(
        Vector2(
          mediaQuery.width * 1 / 3,
          _bottomCoordinateY + _paddingWidth * 0.3,
        ),
      );

  Vector2 get _bottomRightCenterCoordinateVector => screenToWorld(
        Vector2(
          mediaQuery.width * 2 / 3,
          _bottomCoordinateY + _paddingWidth * 0.3,
        ),
      );
  // ===============================

  // Initial method
  @override
  Future<void> onLoad() async {
    // _generator.generateBalls(30).forEach(add);
    createBoundaries().forEach(add);
    return super.onLoad();
  }

  // Create initial boundaries
  List<Component> createBoundaries() {
    logger.info(_bottomLeftCoordinateVector.g);
    _bottomFlameWall = Wall(_bottomLeftCenterCoordinateVector, _bottomRightCenterCoordinateVector);

    return [
      // Left Wall
      Wall(_topLeftCoordinateVector, _bottomLeftCoordinateVector),
      // Right Wall
      Wall(_topRightCoordinateVector, _bottomRightCoordinateVector),
      // Slaiting Left Wall
      Wall(_bottomLeftCoordinateVector, _slatingLeftVector),
      // Slaiting Right Wall
      Wall(_bottomRightCoordinateVector, _slatingRightVector),
      // Left Bottom Wall
      Wall(_slatingLeftVector, _bottomLeftCenterCoordinateVector),
      // Right Bottom Wall
      Wall(_slatingRightVector, _bottomRightCenterCoordinateVector),
      // Center Bottom Wall
      _bottomFlameWall,
    ];
  }

  // Add bottom layer
  void onCreateBottomWall() {
    _bottomFlameWall = Wall(_bottomLeftCenterCoordinateVector, _bottomRightCenterCoordinateVector);
    add(_bottomFlameWall);
  }

  // Remove bottom layer
  @override
  Future<void> onRemove() async {
    _bottomFlameWall.onRemove();
  }

  Future<void> onRemoveBeans({required int remainingBeans}) async {
    logger.info(world.bodies[0].position.g);
    // 画面外に出たタイミングでBodyを削除する
    final bottomScreen = screenToWorld(Vector2(0, mediaQuery.height)).g;
    for (var i = 0; i < world.bodies.length; i++) {
      if (world.bodies[i].position.g > bottomScreen) {
        world.destroyBody(world.bodies[i--]);
      }
    }
    logger.info(world.bodies.length - 7);

    // 削除しすぎた場合、追加する処理
    final diff = remainingBeans - (world.bodies.length - 7);
    if (diff != 0) {
      await addBeans(diff);
      logger.info(world.bodies.length - 7);
    }
  }

  // TODO: 追加時にstateとローカルを更新する
  Future<void> addBeans(int balls) async {
    _generator.generateBalls(balls).forEach(add);
  }

  // TODO: ボトル下を通過した数がuse付近になった時点で通知する
  Future<bool> fallBeanObserver(int useBeans) async {
    return false;
  }
}
