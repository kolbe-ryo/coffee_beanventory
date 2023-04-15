// Flutter imports:
import 'package:coffee_beanventory/ui/game_widget/wall.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/ui/game_widget/ball_generator.dart';

class GameWorld extends Forge2DGame with HasTappables {
  GameWorld()
      : _generator = const BallGenerator(),
        super(
          gravity: Vector2(0, 10),
          zoom: 5,
        );

  final BallGenerator _generator;

  static const double _widthWorld = 60;
  static const double _topWorld = 0;
  static const double _bottomWorld = 300;

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
    final bottomRight = screenToWorld(
      Vector2(
        camera.viewport.effectiveSize.x - _widthWorld,
        camera.viewport.effectiveSize.y - _bottomWorld,
      ),
    );
    final bottomLeft = screenToWorld(
      Vector2(
        _widthWorld,
        camera.viewport.effectiveSize.y - _bottomWorld,
      ),
    );
    _bottomWall = Wall(bottomLeft, bottomRight);
    add(_bottomWall);
  }

  // Remove bottom layer
  @override
  Future<void> onRemove() async {
    _bottomWall.onRemove();
  }

  List<Component> createBoundaries() {
    final topLeft = screenToWorld(Vector2(_widthWorld, _topWorld));
    final bottomRight = screenToWorld(
      Vector2(
        camera.viewport.effectiveSize.x - _widthWorld,
        camera.viewport.effectiveSize.y - _bottomWorld,
      ),
    );
    final topRight = screenToWorld(Vector2(camera.viewport.effectiveSize.x - _widthWorld, _topWorld));
    final bottomLeft = screenToWorld(Vector2(_widthWorld, camera.viewport.effectiveSize.y - _bottomWorld));

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
