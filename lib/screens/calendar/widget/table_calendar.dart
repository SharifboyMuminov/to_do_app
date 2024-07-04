import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_text_style.dart';

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
        holidayTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 40.sp,
        ),
        weekendTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
        weekNumberTextStyle: AppTextStyle.nunitoMedium.copyWith(
          color: AppColors.c4C4C69,
          fontSize: 10.sp,
        ),
      ),
      selectedDayPredicate: selectedDayPredicate,
      onDaySelected: onDaySelected,
      onFormatChanged: onFormatChanged,
      onPageChanged: onPageChanged,
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
                _getMonthName(day.month), // Customize this as needed
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

  String _getMonthName(int monthDigit) {
    switch (monthDigit) {
      case 1:
        return "Январь";
      case 2:
        return "Февраль";
      case 3:
        return "Март";
      case 4:
        return "Апрель";
      case 5:
        return "Май";
      case 6:
        return "Июнь";
      case 7:
        return "Июль";
      case 8:
        return "Август";
      case 9:
        return "Сентябрь";
      case 10:
        return "Октябрь";
      case 11:
        return "Ноябрь";
      default:
        return "Декабрь";
    }
  }
}
