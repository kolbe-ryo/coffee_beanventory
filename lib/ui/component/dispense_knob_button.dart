// Flutter imports:
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';

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
          angleRange: 280,
          animDurationMultiplier: 0.1,
          customColors: CustomSliderColors(
            trackColor: ColorIndexEnum.cold.colors['trackColor'],
            progressBarColor: ColorIndexEnum.cold.colors['progressBarColor'],
          ),
          customWidths: CustomSliderWidths(
            handlerSize: 7,
            progressBarWidth: 7,
            trackWidth: 6,
          ),
          infoProperties: InfoProperties(
            bottomLabelText: buttonText,
            bottomLabelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            mainLabelStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
            modifier: (percentage) => '${percentage.round()}',
          ),
          size: 80,
          startAngle: 130,
        ),
        // max: 100,
        initialValue: 0,
        onChange: (value) => beanGrams = value.round(),
      ),
      onLongPress: () => function(beanGrams),
    );
  }
}
