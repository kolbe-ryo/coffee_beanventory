// Package imports:
import 'package:flame_forge2d/flame_forge2d.dart';

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
