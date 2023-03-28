// import 'dart:math';
// import 'package:coffee_beanventory/ui/component/ball.dart';
// import 'package:coffee_beanventory/ui/component/ball_generator.dart';
// import 'package:coffee_beanventory/ui/component/box_2d_world.dart';
// import 'package:flame/components.dart';
// import 'package:flame_forge2d/flame_forge2d.dart';
// import 'package:flutter/material.dart';
// import 'package:flame/game.dart';

// class CoffeeBeanventory extends Game {
//   CoffeeBeanventory()
//       : _generator = BallGenerator(Random()),
//         _world = Box2DWorld() {
//     // _timer = Timer();
//   }

//   static const double screenCenterX = 300;
//   static const double screenBottomY = 700;

//   final BallGenerator _generator;
//   final Box2DWorld _world;
//   final List<Ball> _balls = [];
//   // late final Timer _timer;

//   void _generateBall() {
//     final ball = _generator.generateBall();
//     _world.addBall(ball);
//     _balls.add(ball);
//   }

//   @override
//   void update(double dt) {
//     _world.update(dt);
//     _balls.forEach((ball) => ball.update(dt));
//     _balls.removeWhere((Ball ball) => ball.position.y > screenBottomY);
//   }

//   @override
//   void render(Canvas canvas) {
//     _balls.forEach((ball) => ball.render(canvas));
//   }
// }
