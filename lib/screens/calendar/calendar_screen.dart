import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/screens/calendar/widget/table_calendar.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/app_images.dart';
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/utils/app_text_style.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          55.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.we),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    AppImages.xMarksSvg,
                    width: 16.we,
                    height: 16.we,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Сохранить",
                    style: AppTextStyle.nunitoSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.cBCBCBF,
                    ),
                  ),
                ),
              ],
            ),
          ),
          22.getH(),
          MyTableCalendar(
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onPageChanged: (DateTime focusedDay) {
              _focusedDay = focusedDay;
            },
            selectedDayPredicate: (DateTime day) {
              return isSameDay(_selectedDay, day);
            },
            onFormatChanged: (CalendarFormat format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
        ],
      ),
    );
  }

}