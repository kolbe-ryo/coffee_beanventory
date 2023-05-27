// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';

class ColorControllerViewModel {
  ColorControllerViewModel({
    required TickerProvider vsync,
    required this.initialColorIndex,
  }) : _animationController = AnimationController(
          vsync: vsync,
          duration: const Duration(seconds: 1),
        );

  // Define Animation Controller
  final AnimationController _animationController;

  AnimationController get animationController => _animationController;

  // Define Animation
  late final Animation<Color?> _animation = ColorTween(
    begin: initialColorIndex.colors[backgroundColor],
    end: initialColorIndex.switchColorIndex.colors[backgroundColor],
  ).animate(_animationController);

  Animation<Color?> get animation => _animation;

  // Interface for initial color
  final ColorIndexEnum initialColorIndex;

  void changeColor() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  void dispose() => _animationController.dispose();
}
