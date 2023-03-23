import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'ball.dart';

class BallGenerator {
  BallGenerator(this._random);
  static const double initialX = 200;
  static const double minSpeedY = 50;
  static const double maxSpeedY = 150;
  static const double minRadius = 10;
  static const double maxRadius = 30;
  static const List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
  ];

  final Random _random;

  Ball generateBall() {
    final position = Vector2(_random.nextDouble() * initialX, 0);
    final speedY = _random.nextDouble() * (maxSpeedY - minSpeedY) + minSpeedY;
    final velocity = Vector2(0, speedY);
    final radius = _random.nextDouble() * (maxRadius - minRadius) + minRadius;
    final color = colors[_random.nextInt(colors.length)];

    return Ball(position, velocity, radius, color);
  }
}
