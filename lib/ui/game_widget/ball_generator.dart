// Dart imports:
import 'dart:math';

// Package imports:
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/game_widget/bean.dart';

class BeanGenerator {
  const BeanGenerator(this.width);

  final double width;

  List<Bean> generateBalls(int beans) {
    final ballList = <Bean>[];
    final yCoordinate = width / 2 / gameZoom;
    for (var i = 0; i < beans; i++) {
      final position = Vector2(Random().nextDouble() + yCoordinate - 1, 0);
      ballList.add(Bean(position));
    }
    return ballList;
  }
}
