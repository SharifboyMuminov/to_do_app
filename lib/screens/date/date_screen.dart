import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2024 Calendar'),
      ),
      body: TableCalendar(
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
    );
  }
}
