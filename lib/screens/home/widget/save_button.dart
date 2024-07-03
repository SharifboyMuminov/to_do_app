import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onTab, required this.isActive});

  final VoidCallback onTab;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.we),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.he),
            backgroundColor: isActive ? AppColors.cFF8702 : AppColors.cF2F2F2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(69.r),
            ),
          ),
          onPressed: isActive ? onTab : null,
          child: Text(
            "Сохранить",
            style: AppTextStyle.nunitoRegular.copyWith(
              fontSize: 20.sp,
              color: isActive ? AppColors.white : AppColors.cBCBCBF,
            ),
          ),
        ),
      ),
    );
  }
}
