// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';

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
          backgroundColor: const Color.fromARGB(255, 220, 184, 148),
          trackColor: Colors.orangeAccent,
          progressBarColor: Colors.deepOrange,
          splashColor: Colors.deepOrangeAccent,
        };
      case ColorIndexEnum.cold:
        return {
          backgroundColor: Colors.blueGrey,
          trackColor: Colors.lightBlue,
          progressBarColor: Colors.blueAccent,
          splashColor: Colors.blue,
        };
    }
  }

  ColorIndexEnum get switchColorIndex {
    switch (this) {
      case ColorIndexEnum.warm:
        return ColorIndexEnum.cold;
      case ColorIndexEnum.cold:
        return ColorIndexEnum.warm;
    }
  }
}
