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
      : _generator = const BallGenerator(),
        super(zoom: 5);

  final BallGenerator _generator;
  final Size mediaQuery;

  late Component _bottomFlameWall;
  late Component _bottomWall;

  static const _heightShoulderRate = 0.53;
  static const _heightNeckRate = 0.60;

  @override
  Color backgroundColor() => Colors.transparent;

  // Getter for coordinates for Walls
  // ===============================
  double get _paddingWidth => (mediaQuery.width * (1 - widthRate + 0.05)) / 2;

  double get _bottomCoordinateY => mediaQuery.height * (widthRate + 0.03);

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
          mediaQuery.height * _heightShoulderRate,
        ),
      );

  Vector2 get _bottomRightCoordinateVector => screenToWorld(
        Vector2(
          camera.viewport.effectiveSize.x - _paddingWidth,
          mediaQuery.height * _heightShoulderRate,
        ),
      );

  Vector2 get _slatingLeftVector => screenToWorld(
        Vector2(
          mediaQuery.width * 1 / 3,
          mediaQuery.height * _heightNeckRate,
        ),
      );

  Vector2 get _slatingRightVector => screenToWorld(
        Vector2(
          mediaQuery.width * 2 / 3,
          mediaQuery.height * _heightNeckRate,
        ),
      );

  Vector2 get _bottomLeftCenterCoordinateVector => screenToWorld(
        Vector2(
          mediaQuery.width * 1 / 3,
          _bottomCoordinateY + _paddingWidth * 0.3,
        ),
      );

// TODO
  Vector2 get _bottomRightCenterCoordinateVector => screenToWorld(
        Vector2(
          mediaQuery.width * 2 / 3,
          _bottomCoordinateY + _paddingWidth * 0.3,
        ),
      );
// TODO
  Vector2 get _bottomLeftForRemoveBody => screenToWorld(
        Vector2(
          0,
          mediaQuery.height - 100,
        ),
      );
// TODO
  Vector2 get _bottomRightForRemoveBody => screenToWorld(
        Vector2(
          mediaQuery.width,
          mediaQuery.height - 100,
        ),
      );

  // Initial method
  @override
  Future<void> onLoad() async {
    _generator.generateBalls(30).forEach(add);
    createBoundaries().forEach(add);
    return super.onLoad();
  }

  // Create initial boundaries
  List<Component> createBoundaries() {
    _bottomFlameWall = Wall(_bottomLeftCenterCoordinateVector, _bottomRightCenterCoordinateVector);
    _bottomWall = Wall(_bottomLeftForRemoveBody, _bottomRightForRemoveBody);

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
      // Bottom For Remove Body
      // _bottomWall,
    ];
  }

  // Add bottom layer
  void onCreate() {
    _bottomFlameWall = Wall(_bottomLeftCenterCoordinateVector, _bottomRightCenterCoordinateVector);
    add(_bottomFlameWall);
  }

  // Remove bottom layer
  @override
  Future<void> onRemove() async {
    _bottomFlameWall.onRemove();
  }

  void onRemoveBeans() {
    logger.info(world.bodies.length);

    for (var i = 0; i < world.bodies.length; i++) {
      if (world.bodies[i].position.g > 150) {
        world.destroyBody(world.bodies[i]);
        i--;
      }
    }
    logger.info(world.bodies.length);
  }

  int onCount() {
    final allBody = world.bodies;
    logger.info(allBody.first.userData.runtimeType);
    logger.info(allBody.first.position.g);
    return world.bodies.length - 7;
  }

  // TODO: 追加時にstateとローカルを更新する
  Future<void> addBeans(int balls) async {
    _generator.generateBalls(balls).forEach(add);
  }
}
