// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class FrameSketch extends StatelessWidget {
  const FrameSketch({super.key});

  @override
  Widget build(BuildContext context) {
    final flameSize = MediaQuery.of(context).size;
    return SvgPicture.asset(
      'assets/images/frame_sketch.svg',
      width: flameSize.width,
    );
  }
}
