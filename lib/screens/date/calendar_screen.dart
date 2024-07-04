import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          55.getH(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 14.we),
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
                    "Сегодня",
                    style: AppTextStyle.nunitoSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.cBCBCBF,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TableCalendar(
            locale: 'ru',
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
                // selectedColor: Colors.deepOrange[400],
                // todayColor: Colors.deepOrange[200],
                // markersColor: Colors.brown[700],
                ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle().copyWith(color: Colors.red[600]),
            ),
            focusedDay: DateTime.now(),
            firstDay: DateTime.now(),
            lastDay: DateTime(2040),
          ),
        ],
      ),
    );
  }
}
