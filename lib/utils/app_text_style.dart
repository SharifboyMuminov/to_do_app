import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/utils/app_colors.dart';

class AppTextStyle {

  AppTextStyle._();

  // Nunito
  static TextStyle nunitoThin = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w200,
    fontSize: 14.sp,
    color: AppColors.black,
  );
  static TextStyle nunitoLight = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w300,
    fontSize: 14.sp,
    color: AppColors.black,
  );
  static TextStyle nunitoRegular = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.black,
  );
  static TextStyle nunitoMedium = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.black,
  );

  static TextStyle nunitoSemiBold = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: AppColors.black,
  );

  static TextStyle nunitoBold = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w700,
    fontSize: 16.w,
    color: AppColors.black,
  );

  static TextStyle nunitoBlack = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w800,
    fontSize: 16.sp,
    color: AppColors.black,
  );
}
