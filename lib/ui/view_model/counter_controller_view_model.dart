import 'package:flutter/material.dart';

class CounterControllerViewModel {
  CounterControllerViewModel({
    required TickerProvider vsync,
  }) : _animationController = AnimationController(
          vsync: vsync,
          duration: const Duration(seconds: 2),
        );

  // Define Animation Controller
  final AnimationController _animationController;

  AnimationController get animationController => _animationController;

  // Define Animation
  late Animation<double> _animation = Tween<double>(begin: 0, end: 100).animate(_animationController);

  Animation<double> get animation => _animation;

  void setAnimation({required double begin, required double end}) {
    _animation = Tween<double>(begin: begin, end: end).animate(_animationController);
  }

  void startAnimation() {
    // if (_animationController.isAnimating) {
    //   return;
    // }
    _animationController.forward();
  }

  void dispose() => _animationController.dispose();
}