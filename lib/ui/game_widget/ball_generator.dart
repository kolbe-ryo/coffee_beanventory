// Dart imports:
import 'dart:math';

// Package imports:
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/ui/game_widget/ball.dart';

class BallGenerator {
  const BallGenerator();

  List<Ball> generateBalls(int balls) {
    final ballList = <Ball>[];
    for (var i = 0; i < balls; i++) {
      final position = Vector2(Random().nextDouble() * 50 + 15, 0);
      ballList.add(Ball(position));
    }
    return ballList;
  }
}
