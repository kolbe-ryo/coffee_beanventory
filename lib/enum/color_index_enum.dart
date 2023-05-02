// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

enum ColorIndexEnum {
  @JsonValue('warm')
  warm,
  @JsonValue('cold')
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
          'background': Colors.blueGrey,
          'trackColor': Colors.lightBlue,
          'progressBarColor': Colors.blueAccent,
          'splashColor': Colors.blue,
        };
    }
  }
}
