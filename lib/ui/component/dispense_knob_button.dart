// Flutter imports:
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
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          angleRange: 280,
          animDurationMultiplier: 0.1,
          customColors: CustomSliderColors(
            trackColor: Colors.amberAccent,
            progressBarColor: Colors.orange,
          ),
          customWidths: CustomSliderWidths(
            handlerSize: 6,
            progressBarWidth: 6,
            trackWidth: 5,
          ),
          infoProperties: InfoProperties(
            bottomLabelText: buttonText,
            bottomLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            mainLabelStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
            modifier: (percentage) => '${percentage.round()}',
          ),
          size: 70,
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
