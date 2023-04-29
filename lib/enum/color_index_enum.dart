import 'package:flutter/material.dart';

enum ColorIndexEnum {
  warm,
  cold,
}

extension ColorIndexEnumExt on ColorIndexEnum {
  Map<String, Color> get colors {
    switch (this) {
      case ColorIndexEnum.warm:
        return {
          'background': const Color.fromARGB(255, 220, 184, 148),
          'trackColor': Colors.orangeAccent,
          'progressBarColor': Colors.deepOrange,
          'splashColor': Colors.deepOrangeAccent,
        };
      case ColorIndexEnum.cold:
        return {
          'background': const Color.fromARGB(255, 220, 184, 148),
          'trackColor': Colors.orangeAccent,
          'progressBarColor': Colors.deepOrange,
          'splashColor': Colors.deepOrangeAccent,
        };
    }
  }
}
