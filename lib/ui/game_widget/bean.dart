// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/ui/component/paint/coffee_bean.dart';

class Bean extends BodyComponent with Tappable {
  Bean(this._position) : super(paint: Paint()..color = _color);
  final Vector2 _position;
  static const Color _color = Colors.transparent;

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 2;

    final fixtureDef = FixtureDef(
      shape,
      restitution: 0,
      density: 1,
      friction: 1,
    );

    final bodyDef = BodyDef(
      userData: this,
      position: _position,
      type: BodyType.dynamic,
      gravityScale: Vector2(0, 10),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  bool onTapDown(_) {
    body.applyLinearImpulse(Vector2.random() * 5000);
    return false;
  }

  @override
  void onRemove() {}

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.save();
    RPSCustomPainter().paint(
      canvas,
      const Size(5, 5),
    );
    canvas.restore();
  }
}
