// Flutter imports:
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Package imports:
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';

class DispenseKnobButton extends ConsumerWidget {
  const DispenseKnobButton({
    required this.buttonText,
    required this.function,
    super.key,
  });

  final String buttonText;
  final Future<void> Function(int) function;

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    var beanGrams = 0;
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    return InkWell(
      borderRadius: BorderRadius.circular(knobRadius / 2),
      splashColor: colorIndexEnum.colors['splashColor'],
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          angleRange: angleRange,
          customColors: CustomSliderColors(
            trackColor: colorIndexEnum.colors['trackColor'],
            progressBarColor: colorIndexEnum.colors['progressBarColor'],
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
