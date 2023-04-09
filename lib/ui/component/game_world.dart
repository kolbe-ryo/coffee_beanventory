import 'package:coffee_beanventory/ui/component/ball_generator.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

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

  @override
  // Color backgroundColor() => Colors.orange.withOpacity(0.2);
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    _generator.generateBalls(30).forEach(add);
    createBoundaries().forEach(add);
    return super.onLoad();
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

    return [
      Wall(topRight, bottomRight),
      Wall(bottomLeft, bottomRight),
      Wall(topLeft, bottomLeft),
    ];
  }

  Future<void> addBalls(int balls) async {
    _generator.generateBalls(balls).forEach(add);
  }
}

class Wall extends BodyComponent {
  Wall(this._start, this._end)
      : super(
        // paint: Paint()..color = Colors.transparent,
        );
  final Vector2 _start;
  final Vector2 _end;

  @override
  Body createBody() {
    final shape = EdgeShape()..set(_start, _end);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
