import 'package:bmicalculator/screens/input_page.dart';
import 'package:flutter/material.dart';

class SliderClass extends StatelessWidget {
  final double vaLUE;
  final double min;
  final double max;
  void Function(double)? onchanged;

  SliderClass(
      {Key? key,
        required this.vaLUE,
        this.onchanged,
        required this.min,
        required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: kInactiveColor,
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor:  Colors.transparent,
          thumbColor: kActiveColor,
          valueIndicatorColor: const Color(0xffEC6F78),
          valueIndicatorShape: const DropSliderValueIndicatorShape(),
          // showValueIndicator: ShowValueIndicator.always,
          overlayShape: SliderComponentShape.noOverlay,
          trackHeight: 10,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12)),
      child: Slider(
          value: vaLUE,
          min: min,
          max: max,
          label: vaLUE.toString(),
          divisions: 10,
          onChanged: onchanged),
    );
  }
}
