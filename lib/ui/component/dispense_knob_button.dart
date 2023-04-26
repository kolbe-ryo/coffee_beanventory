// Flutter imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/ui/top_page/top_page_view_model.dart';

class DispenseKnobButton extends ConsumerWidget {
  const DispenseKnobButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var beanGrams = 0;
    return InkWell(
      borderRadius: BorderRadius.circular(knobRadius / 2),
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          angleRange: 350,
          customColors: CustomSliderColors(
            trackColor: Colors.transparent,
            progressBarColor: Colors.orange,
            hideShadow: true,
          ),
          customWidths: CustomSliderWidths(progressBarWidth: 10),
          size: 100,
          startAngle: 90,
        ),
        // min: 0,
        // max: 100,
        initialValue: 0,
        // innerWidget: (percentage) => _CircleButton(),
        onChange: (value) => beanGrams = value.round(),
      ),
      onTap: () => ref.watch(topPageViewModelProvider.notifier).removeBeanGrams(beanGrams),
    );
  }
}
