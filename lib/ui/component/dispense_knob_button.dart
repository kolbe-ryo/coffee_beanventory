// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';

class DispenseKnobButton extends ConsumerWidget {
  const DispenseKnobButton({
    required this.buttonText,
    required this.function,
    super.key,
  });

  final String buttonText;
  final Future<void> Function(int) function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    final beanGrams = ref.watch(
      globalManagerProvider.select((value) {
        if (isAdd) {
          return value.addBeans;
        } else {
          return value.useBeans;
        }
      }),
    );
    final beanAddMax = ref.watch(globalManagerProvider.select((value) => value.beanAddMax));
    return InkWell(
      borderRadius: BorderRadius.circular(knobRadius / 2),
      splashColor: colorIndexEnum.colors[splashColor],
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          angleRange: angleRange,
          customColors: CustomSliderColors(
            trackColor: colorIndexEnum.colors[trackColor],
            progressBarColor: colorIndexEnum.colors[progressBarColor],
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
              fontWeight: FontWeight.bold,
            ),
            mainLabelStyle: const TextStyle(
              fontSize: largeFontSize,
              fontWeight: FontWeight.bold,
            ),
            modifier: (percentage) => '${percentage.round()}g',
          ),
          size: beanAddMax.toDouble(),
          startAngle: circleAngle,
        ),
        // max: 100,
        initialValue: beanGrams.toDouble(),
        onChange: (value) {
          if (isAdd) {
            ref.read(globalManagerProvider.notifier).changeAddBeans(value.round());
            // TODO: ボタン押下と同時にAnimationを更新する（begin, end） startAnimation
          } else {
            ref.read(globalManagerProvider.notifier).changeUseBeans(value.round());
            // TODO: ボタン押下と同時にAnimationを更新する（begin, end） startAnimation
          }
        },
      ),
      onLongPress: () => function(beanGrams),
    );
  }

  bool get isAdd => function.toString().contains('addBeanGrams');
}
