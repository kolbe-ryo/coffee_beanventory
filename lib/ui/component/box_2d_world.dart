// import 'package:flame_forge2d/flame_forge2d.dart';

// import 'ball.dart';

// class Box2DWorld {
//   Box2DWorld() {
//     _world = World(Vector2(0, gravityY));
//   }

//   static const double gravityY = 10;

//   late final World _world;

//   void addBall(Ball ball) {
//     final circleShape = CircleShape()
//       ..radius = ball.radius
//       ..position.setZero();

//     final fixtureDef = FixtureDef(circleShape)
//       ..density = 1.0
//       ..friction = 0.0
//       ..restitution = 1.0;

//     final bodyDef = BodyDef()
//       ..position = ball.position
//       ..linearVelocity = ball.velocity;

//     _world.createBody(bodyDef)
//       ..createFixture(fixtureDef)
//       ..userData = ball;
//   }

//   void update(double dt) {
//     _world.stepDt(dt);
//   }
// }
