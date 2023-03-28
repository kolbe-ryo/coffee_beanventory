import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:forge2d/src/common/transform.dart' as transform;

class Ball extends BodyComponent with Tappable {
  Ball(this._position);
  final Vector2 _position;

  @override
  Body createBody() {
    // final shape = CircleShape()..radius = 1;
    final shape = CircleShape()..radius = 1;

    final fixtureDef = FixtureDef(
      shape,
      restitution: 0.6,
      density: 0.8,
      friction: 0.4,
    );

    final bodyDef = BodyDef(
      userData: this,
      position: _position,
      type: BodyType.dynamic,
      // gravityOverride: Vector2(0, 10),
      gravityScale: Vector2(0, 30),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  bool onTapDown(_) {
    body.applyLinearImpulse(Vector2.random() * 5000);
    return false;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter implements Shape {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6047445, size.height * 0.8192955);
    path_0.cubicTo(size.width * 0.6047445, size.height * 0.6609103, size.width * 0.5428211, size.height * 0.5838519,
        size.width * 0.4772702, size.height * 0.5022671);
    path_0.cubicTo(size.width * 0.4138771, size.height * 0.4233716, size.width * 0.3483419, size.height * 0.3418259,
        size.width * 0.3483419, size.height * 0.1811501);
    path_0.cubicTo(size.width * 0.3483419, size.height * 0.1235811, size.width * 0.3564800, size.height * 0.07368898,
        size.width * 0.3734130, size.height * 0.02704900);
    path_0.cubicTo(size.width * 0.2197809, size.height * 0.09448388, size.width * 0.1090208, size.height * 0.2809422,
        size.width * 0.1090208, size.height * 0.5000000);
    path_0.cubicTo(size.width * 0.1090208, size.height * 0.7757122, size.width * 0.2844171, size.height,
        size.width * 0.4999961, size.height);
    path_0.cubicTo(size.width * 0.5264431, size.height, size.width * 0.5522648, size.height * 0.9965837,
        size.width * 0.5772421, size.height * 0.9901654);
    path_0.cubicTo(size.width * 0.5762649, size.height * 0.9858266, size.width * 0.5764838, size.height * 0.9811595,
        size.width * 0.5781880, size.height * 0.9766878);
    path_0.cubicTo(size.width * 0.5960591, size.height * 0.9296257, size.width * 0.6047445, size.height * 0.8781466,
        size.width * 0.6047445, size.height * 0.8192955);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4999961, 0);
    path_1.cubicTo(size.width * 0.4768715, 0, size.width * 0.4542473, size.height * 0.002736171, size.width * 0.4322172,
        size.height * 0.007676913);
    path_1.cubicTo(size.width * 0.4319749, size.height * 0.008317959, size.width * 0.4318107, size.height * 0.008974640,
        size.width * 0.4315058, size.height * 0.009607868);
    path_1.cubicTo(size.width * 0.4067708, size.height * 0.06057882, size.width * 0.3952477, size.height * 0.1150833,
        size.width * 0.3952477, size.height * 0.1811423);
    path_1.cubicTo(size.width * 0.3952477, size.height * 0.3253072, size.width * 0.4501900, size.height * 0.3936880,
        size.width * 0.5138098, size.height * 0.4728494);
    path_1.cubicTo(size.width * 0.5784304, size.height * 0.5532693, size.width * 0.6516503, size.height * 0.6443916,
        size.width * 0.6516503, size.height * 0.8192798);
    path_1.cubicTo(size.width * 0.6516503, size.height * 0.8751212, size.width * 0.6443721, size.height * 0.9252009,
        size.width * 0.6295577, size.height * 0.9716533);
    path_1.cubicTo(size.width * 0.7816419, size.height * 0.9031239, size.width * 0.8909792, size.height * 0.7176272,
        size.width * 0.8909792, size.height * 0.4999844);
    path_1.cubicTo(
        size.width * 0.8909871, size.height * 0.2242956, size.width * 0.7155907, 0, size.width * 0.4999961, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  double radius = 1;

  @override
  // TODO: implement childCount
  int get childCount => throw UnimplementedError();

  @override
  Shape clone() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  void computeAABB(AABB aabb, transform.Transform xf, int childIndex) {
    // TODO: implement computeAABB
  }

  @override
  double computeDistanceToOut(transform.Transform xf, Vector2 p, int childIndex, Vector2 normalOut) {
    // TODO: implement computeDistanceToOut
    throw UnimplementedError();
  }

  @override
  void computeMass(MassData massData, double density) {
    // TODO: implement computeMass
  }

  @override
  bool raycast(RayCastOutput output, RayCastInput input, transform.Transform transform, int childIndex) {
    // TODO: implement raycast
    throw UnimplementedError();
  }

  @override
  // TODO: implement shapeType
  ShapeType get shapeType => throw UnimplementedError();

  @override
  bool testPoint(transform.Transform xf, Vector2 p) {
    // TODO: implement testPoint
    throw UnimplementedError();
  }
}
