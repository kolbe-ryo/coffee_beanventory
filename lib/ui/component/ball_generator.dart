import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'ball.dart';

class BallGenerator {
  const BallGenerator();

  List<Ball> generateBalls(int balls) {
    final ballList = <Ball>[];
    for (var i = 0; i < balls; i++) {
      final position = Vector2(Random().nextDouble() * 180 + 80, 0);
      ballList.add(Ball(position));
    }
    return ballList;
  }
}
