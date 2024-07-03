import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/models/category/category_model.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.onTAb,
    required this.isActive,
  });

  final CategoryModel categoryModel;
  final VoidCallback onTAb;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.we, vertical: 6.he),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(76.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.cB6A1C0.withOpacity(0.11),
              blurRadius: 10.8,
              spreadRadius: 0,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: SizedBox(
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(
                left: 20.we,
                right: 20.we,
                top: 23.we,
                bottom: 30.we,
              ),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(76.r),
                side: isActive
                    ? BorderSide(color: AppColors.cFF8702, width: 2.we)
                    : const BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
            onPressed: onTAb,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  categoryModel.iconPath,
                  width: 53.we,
                  height: 50.he,
                ),
                Text(
                  categoryModel.title,
                  style: AppTextStyle.nunitoRegular.copyWith(
                    color: AppColors.c4C4C69,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
