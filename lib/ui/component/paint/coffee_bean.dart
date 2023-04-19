// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final offset = const Offset(-2, -2);
  @override
  void paint(Canvas canvas, Size size) {
    final path0 = Path();
    path0.moveTo(size.width * 0.6047445, size.height * 0.8192955);
    path0.cubicTo(size.width * 0.6047445, size.height * 0.6609103, size.width * 0.5428211, size.height * 0.5838519,
        size.width * 0.4772702, size.height * 0.5022671);
    path0.cubicTo(size.width * 0.4138771, size.height * 0.4233716, size.width * 0.3483419, size.height * 0.3418259,
        size.width * 0.3483419, size.height * 0.1811501);
    path0.cubicTo(size.width * 0.3483419, size.height * 0.1235811, size.width * 0.3564800, size.height * 0.07368898,
        size.width * 0.3734130, size.height * 0.02704900);
    path0.cubicTo(size.width * 0.2197809, size.height * 0.09448388, size.width * 0.1090208, size.height * 0.2809422,
        size.width * 0.1090208, size.height * 0.5000000);
    path0.cubicTo(size.width * 0.1090208, size.height * 0.7757122, size.width * 0.2844171, size.height,
        size.width * 0.4999961, size.height);
    path0.cubicTo(size.width * 0.5264431, size.height, size.width * 0.5522648, size.height * 0.9965837,
        size.width * 0.5772421, size.height * 0.9901654);
    path0.cubicTo(size.width * 0.5762649, size.height * 0.9858266, size.width * 0.5764838, size.height * 0.9811595,
        size.width * 0.5781880, size.height * 0.9766878);
    path0.cubicTo(size.width * 0.5960591, size.height * 0.9296257, size.width * 0.6047445, size.height * 0.8781466,
        size.width * 0.6047445, size.height * 0.8192955);
    path0.close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [Color.fromARGB(255, 28, 16, 4), Color.fromARGB(255, 42, 28, 13), Color.fromARGB(255, 64, 41, 13)],
        stops: [0, 0.5, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(center: Offset(0, 0), radius: 3))
      ..color = Color.fromARGB(255, 35, 16, 1);
    canvas.drawPath(path0.shift(offset), paint0Fill);

    final path1 = Path();
    path1.moveTo(size.width * 0.4999961, 0);
    path1.cubicTo(size.width * 0.4768715, 0, size.width * 0.4542473, size.height * 0.002736171, size.width * 0.4322172,
        size.height * 0.007676913);
    path1.cubicTo(size.width * 0.4319749, size.height * 0.008317959, size.width * 0.4318107, size.height * 0.008974640,
        size.width * 0.4315058, size.height * 0.009607868);
    path1.cubicTo(size.width * 0.4067708, size.height * 0.06057882, size.width * 0.3952477, size.height * 0.1150833,
        size.width * 0.3952477, size.height * 0.1811423);
    path1.cubicTo(size.width * 0.3952477, size.height * 0.3253072, size.width * 0.4501900, size.height * 0.3936880,
        size.width * 0.5138098, size.height * 0.4728494);
    path1.cubicTo(size.width * 0.5784304, size.height * 0.5532693, size.width * 0.6516503, size.height * 0.6443916,
        size.width * 0.6516503, size.height * 0.8192798);
    path1.cubicTo(size.width * 0.6516503, size.height * 0.8751212, size.width * 0.6443721, size.height * 0.9252009,
        size.width * 0.6295577, size.height * 0.9716533);
    path1.cubicTo(size.width * 0.7816419, size.height * 0.9031239, size.width * 0.8909792, size.height * 0.7176272,
        size.width * 0.8909792, size.height * 0.4999844);
    path1.cubicTo(
        size.width * 0.8909871, size.height * 0.2242956, size.width * 0.7155907, 0, size.width * 0.4999961, 0);
    path1.close();

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [Color.fromARGB(255, 55, 31, 9), Color.fromARGB(255, 46, 30, 14), Color.fromARGB(255, 29, 17, 6)],
        stops: [0, 0.5, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(center: Offset(0, 0), radius: 3))
      ..color = Color.fromARGB(255, 35, 16, 1);
    canvas.drawPath(path1.shift(offset), paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
