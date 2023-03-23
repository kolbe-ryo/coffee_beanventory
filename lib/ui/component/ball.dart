// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame_forge2d/flame_forge2d.dart';

class Ball {
  Ball(
    this.position,
    this.velocity,
    this.radius,
    this.color,
  );

  Vector2 position;
  Vector2 velocity;
  double radius;
  Color color;

  void update(double dt) {
    position += velocity * dt;
  }

  void render(Canvas canvas) {
    final paint = Paint()..color = color;
    canvas.drawCircle(Offset(position.x, position.y), radius, paint);
  }
}
