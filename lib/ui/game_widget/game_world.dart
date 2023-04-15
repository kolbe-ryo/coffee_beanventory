// Flutter imports:
import 'package:coffee_beanventory/ui/game_widget/wall.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/ui/game_widget/ball_generator.dart';
import '../../constant/constants.dart';

class GameWorld extends Forge2DGame with HasTappables {
  GameWorld(this._mediaQuery)
      : _generator = const BallGenerator(),
        super(
          // gravity: Vector2(0, 10),
          zoom: 5,
        );

  final BallGenerator _generator;
  final Size _mediaQuery;

  late Component _bottomWall;

  @override
  // Color backgroundColor() => Colors.orange.withOpacity(0.2);
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    _generator.generateBalls(30).forEach(add);
    createBoundaries().forEach(add);
    return super.onLoad();
  }

  // Add bottom layer
  Future<void> onCreate() async {
    final widthWorld = baseWidthRate * _mediaQuery.width;
    final bottomWorld = _mediaQuery.width * aspectRateOfFlame - widthWorld;
    final bottomLeft = screenToWorld(Vector2(widthWorld, bottomWorld));
    final bottomRight = screenToWorld(Vector2(camera.viewport.effectiveSize.x - widthWorld, bottomWorld));
    _bottomWall = Wall(bottomLeft, bottomRight);
    add(_bottomWall);
  }

  // Remove bottom layer
  @override
  Future<void> onRemove() async {
    _bottomWall.onRemove();
  }

  List<Component> createBoundaries() {
    final widthWorld = baseWidthRate * _mediaQuery.width;
    final bottomWorld = _mediaQuery.width * aspectRateOfFlame - widthWorld;
    final topLeft = screenToWorld(Vector2(widthWorld, topWorld));
    final topRight = screenToWorld(Vector2(camera.viewport.effectiveSize.x - widthWorld, topWorld));
    final bottomLeft = screenToWorld(Vector2(widthWorld, bottomWorld));
    final bottomRight = screenToWorld(Vector2(camera.viewport.effectiveSize.x - widthWorld, bottomWorld));

    _bottomWall = Wall(bottomLeft, bottomRight);

    return [
      Wall(topRight, bottomRight),
      Wall(topLeft, bottomLeft),
      _bottomWall,
    ];
  }

  // TODO: 追加時にstateとローカルを更新する
  Future<void> addBalls(int balls) async {
    _generator.generateBalls(balls).forEach(add);
  }
}
