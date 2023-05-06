// Flutter imports:
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';

class DisplayMeter extends ConsumerWidget {
  const DisplayMeter({
    required this.buttonText,
    super.key,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meterValue = ref.watch(globalManagerProvider.select((value) => value.beanGrams));
    return SleekCircularSlider(
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
          modifier: (_) => '${meterValue}g',
        ),
        size: circleMeterRadius,
        startAngle: circleAngle,
      ),
      // max: 100,
      initialValue: meterValue.toDouble(),
    );
  }
}
