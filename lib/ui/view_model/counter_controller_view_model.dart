import 'package:flutter/material.dart';

class CounterControllerViewModel {
  CounterControllerViewModel({
    required this.vsync,
  });

  final TickerProvider vsync;

  // Define Animation Controller
  late AnimationController _animationController;

  AnimationController? get animationController => _animationController;

  // Define Animation
  late Animation<double> _animation;

  Animation<double> get animation => _animation;

  void setAnimation({required double begin, required double end}) {
    // dispose();
    _animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    );
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
