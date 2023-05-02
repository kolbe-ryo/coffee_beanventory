// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';

class DispenseKnobButton extends StatelessWidget {
  const DispenseKnobButton({
    required this.buttonText,
    required this.function,
    super.key,
  });

  final String buttonText;
  final Future<void> Function(int) function;

  @override
  Widget build(BuildContext context) {
    var beanGrams = 0;
    return InkWell(
      borderRadius: BorderRadius.circular(knobRadius / 2),
      splashColor: ColorIndexEnum.cold.colors['splashColor'],
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          angleRange: angleRange,
          customColors: CustomSliderColors(
            trackColor: ColorIndexEnum.cold.colors['trackColor'],
            progressBarColor: ColorIndexEnum.cold.colors['progressBarColor'],
          ),
          customWidths: CustomSliderWidths(
            handlerSize: handlerSize,
            progressBarWidth: progressBarWidth,
            trackWidth: trackWidth,
          ),
          infoProperties: InfoProperties(
            bottomLabelText: buttonText,
            bottomLabelStyle: const TextStyle(
              fontSize: regularFontSize,
              fontWeight: FontWeight.w300,
            ),
            mainLabelStyle: const TextStyle(
              fontSize: largeFontSize,
              fontWeight: FontWeight.w400,
            ),
            modifier: (percentage) => '${percentage.round()}g',
          ),
          size: circleMeterRadius,
          startAngle: circleAngle,
        ),
        // max: 100,
        initialValue: 0,
        onChange: (value) => beanGrams = value.round(),
      ),
      onLongPress: () => function(beanGrams),
    );
  }
}
