import 'package:coffee_beanventory/ui/component/ball_generator.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(GameWidget(game: Forge2DExample()));
}

class Forge2DExample extends Forge2DGame with HasTappables {
  Forge2DExample() : _generator = const BallGenerator();

  final BallGenerator _generator;

  @override
  Future<void> onLoad() async {
    _generator.generateBalls(100).forEach(add);
    await addAll(createBoundaries());
    return super.onLoad();
  }

  List<Component> createBoundaries() {
    final topLeft = Vector2.zero();
    final bottomRight = screenToWorld(camera.viewport.effectiveSize);
    final topRight = Vector2(bottomRight.x, topLeft.y);
    final bottomLeft = Vector2(topLeft.x, bottomRight.y);

    return [
      Wall(topLeft, topRight),
      Wall(topRight, bottomRight),
      Wall(bottomLeft, bottomRight),
      Wall(topLeft, bottomLeft),
    ];
  }
}

class Wall extends BodyComponent {
  Wall(this._start, this._end);
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
