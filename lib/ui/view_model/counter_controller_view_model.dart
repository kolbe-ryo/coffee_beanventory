// Flutter imports:
import 'package:flutter/material.dart';

class CounterControllerViewModel {
  CounterControllerViewModel({
    required TickerProvider vsync,
    required this.begin,
    required this.end,
  }) : _animationController = AnimationController(
          vsync: vsync,
          duration: const Duration(seconds: 2),
        );

  final double begin;
  final double end;

  // Define Animation Controller
  final AnimationController _animationController;

  AnimationController get animationController => _animationController;

  // Define Animation
  late Animation<double> _animation = Tween<double>(begin: 0, end: end).animate(_animationController);

  Animation<double> get animation => _animation;

  void setAnimation({required double begin, required double end}) {
    _animationController.reset();
    final endCount = (end > 0) ? end : 0.0;
    _animation = Tween<double>(begin: begin, end: endCount).animate(_animationController);
  }

  void startAnimation() {
    // if (_animationController.isAnimating) {
    //   return;
    // }
    _animationController.forward();
  }

  void dispose() => _animationController.dispose();
}
