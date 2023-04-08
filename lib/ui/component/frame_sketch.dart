import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FrameSketch extends StatelessWidget {
  const FrameSketch({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/frame_sketch.svg',
      color: Colors.brown.shade600,
    );
  }
}
