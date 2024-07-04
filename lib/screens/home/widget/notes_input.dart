import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class NotesInput extends StatelessWidget {
  const NotesInput({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  final ValueChanged<String> onChanged;
  final TextEditingController controller;

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
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          textInputAction: TextInputAction.done,
          maxLines: 4,
          cursorColor: AppColors.c4C4C69,
          style: AppTextStyle.nunitoRegular.copyWith(
            fontSize: 14.sp,
            color: AppColors.c4C4C69,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            hintText: "Введите заметку",
            hintStyle: AppTextStyle.nunitoRegular.copyWith(
              fontSize: 14.sp,
              color: AppColors.cBCBCBF,
            ),
          ),
        ),
      ),
    );
  }
}
