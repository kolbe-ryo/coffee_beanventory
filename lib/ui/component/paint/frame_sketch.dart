// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.imagePath, {super.key});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final flameSize = MediaQuery.of(context).size;
    return SvgPicture.asset(
      imagePath,
      width: flameSize.width,
    );
  }
}
