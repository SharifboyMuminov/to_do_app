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
          22.getH(),
          TableCalendar(
            locale: 'ru',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
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
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) {
                return Text(
                  '${day.year} ${day.month}', // Customize this as needed
                  style: TextStyle(
                    fontSize: 24, // Change font size
                    fontWeight: FontWeight.bold, // Change font weight
                    color: Colors.blue, // Change text color
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
