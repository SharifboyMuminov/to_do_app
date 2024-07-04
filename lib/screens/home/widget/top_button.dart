import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class TopMyButton extends StatelessWidget {
  const TopMyButton({
    super.key,
    required this.onTab,
    required this.title,
    required this.iconPath,
    required this.isActive,
  });

  final VoidCallback onTab;
  final String title;
  final String iconPath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isActive ? AppColors.cFF8702 : AppColors.cF2F2F2,
        padding: EdgeInsets.symmetric(vertical: 9.he, horizontal: 17.we),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(47.r),
        ),
      ),
      onPressed: onTab,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 12.we,
            height: 12.we,
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.white : AppColors.cBCBCBF,
              BlendMode.srcIn,
            ),
          ),
          6.getW(),
          Text(
            "Дневник настроения",
            style: AppTextStyle.nunitoMedium.copyWith(
              color: isActive ? AppColors.white : AppColors.cBCBCBF,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
