// Package imports:
import 'dart:math';

import 'package:coffee_beanventory/constant/constants.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/ui/game_widget/ball.dart';

class BallGenerator {
  const BallGenerator(this.width);

  final double width;

  List<Ball> generateBalls(int balls) {
    final ballList = <Ball>[];
    final yCoordinate = width / 2 / gameZoom;
    for (var i = 0; i < balls; i++) {
      final position = Vector2(Random().nextDouble() + yCoordinate - 1, 0);
      ballList.add(Ball(position));
    }
    return ballList;
  }
}
