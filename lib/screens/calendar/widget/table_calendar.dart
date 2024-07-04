import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_text_style.dart';
import 'package:to_do_app/utils/extension.dart';

class MyTableCalendar extends StatelessWidget {
  const MyTableCalendar({
    super.key,
    required this.focusedDay,
    required this.calendarFormat,
    required this.onPageChanged,
    required this.selectedDayPredicate,
    required this.onFormatChanged,
    required this.onDaySelected,
  });

  final DateTime focusedDay;
  final CalendarFormat calendarFormat;
  final Function(DateTime focusedDay) onPageChanged;
  final bool Function(DateTime day) selectedDayPredicate;
  final Function(CalendarFormat format) onFormatChanged;
  final Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ru',
      daysOfWeekVisible: true,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: focusedDay,
      calendarFormat: calendarFormat,
      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
          color: AppColors.cFF8702,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: AppColors.cFF8702.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        selectedTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.white,
          fontSize: 10.sp,
        ),
        holidayTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 40.sp,
        ),
        todayTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        weekendTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        outsideTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69.withOpacity(0.5),
          fontSize: 10.sp,
        ),
        disabledTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        withinRangeTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        weekNumberTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        rangeEndTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        rangeStartTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        defaultTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
      ),
      selectedDayPredicate: selectedDayPredicate,
      onDaySelected: onDaySelected,
      onFormatChanged: onFormatChanged,
      onPageChanged: onPageChanged,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        leftChevronIcon: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.c4C4C69,
          size: 15.sp,
        ),
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.c4C4C69,
          size: 15.sp,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day.year.toString(),
                style: AppTextStyle.nunitoSemiBold.copyWith(
                  color: AppColors.cBCBCBF,
                  fontSize: 16.sp,
                  height: 0.8,
                ),
              ),
              Text(
                day.month.getMonthName(), // Customize this as needed
                style: AppTextStyle.nunitoSemiBold.copyWith(
                  color: AppColors.c4C4C69,
                  fontSize: 24.sp,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
