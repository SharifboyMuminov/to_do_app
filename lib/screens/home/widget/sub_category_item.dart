import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    super.key,
    required this.onTab,
    required this.title,
    required this.isActive,
  });

  final VoidCallback onTab;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cB6A1C0.withOpacity(0.11),
            blurRadius: 10.8,
            spreadRadius: 0,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 8.we, vertical: 3.he),
          backgroundColor: isActive ? AppColors.cFF8702 : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        onPressed: onTab,
        child: Text(
          title,
          style: AppTextStyle.nunitoRegular.copyWith(
            fontSize: 11.sp,
            color: isActive ? AppColors.white : AppColors.c4C4C69,
          ),
        ),
      ),
    );
  }
}
