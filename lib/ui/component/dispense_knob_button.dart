// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DispenseKnobButton extends StatelessWidget {
  const DispenseKnobButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          angleRange: 360,
          customColors: CustomSliderColors(
            trackColor: Colors.transparent,
            progressBarColor: Colors.orange,
            hideShadow: true,
          ),
          customWidths: CustomSliderWidths(progressBarWidth: 20),
          size: 100,
          startAngle: 0,
        ),
        // min: 0,
        // max: 100,
        initialValue: 0,
        // innerWidget: (percentage) => _CircleButton(),
        onChange: (value) => print(value),
      ),
      onTap: () => print('test'),
    );
  }
}
