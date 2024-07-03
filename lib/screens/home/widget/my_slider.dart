import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_size.dart';

class MySlider extends StatelessWidget {
  const MySlider({
    super.key,
    required this.onChanged,
    required this.currentValue,
    required this.isActive,
  });

  final ValueChanged<double> onChanged;
  final double currentValue;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: isActive ? AppColors.cFF8702 : AppColors.cE1DDD8,
        inactiveTrackColor: AppColors.cE1DDD8,
        trackHeight: 6.he,
        thumbColor: isActive ? AppColors.cFF8702 : AppColors.cE1DDD8,
        overlayColor: AppColors.white,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.we),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 18.we),
      ),
      child: Slider(
        min: 1,
        max: 100,
        value: currentValue,
        onChanged: onChanged,
      ),
    );
  }
}
