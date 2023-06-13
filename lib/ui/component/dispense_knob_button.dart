// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:coffee_beanventory/ui/view_model/counter_controller_view_model.dart';

class DispenseKnobButton extends ConsumerWidget {
  const DispenseKnobButton({
    required this.buttonText,
    required this.beanChanger,
    super.key,
  });

  final String buttonText;
  final Future<void> Function(int) beanChanger;

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
          size: 100,
          startAngle: circleAngle,
        ),
        // max: 100,
        initialValue: beanGrams.toDouble(),
        onChange: (value) {
          if (isAdd) {
            ref.read(globalManagerProvider.notifier).changeAddBeans(value.round());
          } else {
            ref.read(globalManagerProvider.notifier).changeUseBeans(value.round());
          }
        },
      ),
      onLongPress: () {
        final previousGrams = ref.read(globalManagerProvider).beanGrams.toDouble();
        beanChanger(beanGrams);
        final end = isAdd ? previousGrams + beanGrams : previousGrams - beanGrams;
        ref.read(globalManagerProvider.notifier).counterControllerViewModel
          ..setAnimation(begin: previousGrams, end: end)
          ..startAnimation();
      },
    );
  }

  bool get isAdd => beanChanger.toString().contains('addBeanGrams');
}
