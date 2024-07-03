import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/screens/home/widget/my_slider.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class SelfEsteemStressLevel extends StatelessWidget {
  const SelfEsteemStressLevel({
    super.key,
    required this.onChanged,
    required this.firsTitle,
    required this.lastTitle,
    required this.currentValue,
    required this.isActive,
  });

  final ValueChanged<double> onChanged;
  final String firsTitle;
  final String lastTitle;
  final double currentValue;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.we),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(13.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.cB6A1C0.withOpacity(0.11),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.we, vertical: 16.he),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.we),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Card(
                      color: AppColors.cE1DDD8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: SizedBox(
                        width: 2.we,
                        height: 8.we,
                      ),
                    );
                  }),
                ),
              ),
              MySlider(
                onChanged: onChanged,
                currentValue: currentValue,
                isActive: isActive,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    firsTitle,
                    style: AppTextStyle.nunitoRegular
                        .copyWith(fontSize: 11.sp, color: AppColors.c919EAB),
                  ),
                  Text(
                    lastTitle,
                    style: AppTextStyle.nunitoRegular
                        .copyWith(fontSize: 11.sp, color: AppColors.c919EAB),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
