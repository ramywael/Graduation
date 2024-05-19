import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBasicsExample extends StatefulWidget {
  final double screenWidth;
  final DateTime estimatedTime;
  final Function(DateTime) onDaySelected;
  const TableBasicsExample({Key? key, required this.screenWidth, required this.estimatedTime, required this.onDaySelected}) : super(key: key);
  @override
  TableBasicsExampleState createState() => TableBasicsExampleState();
}

class TableBasicsExampleState extends State<TableBasicsExample> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime kFirstDay = DateTime.now();
   DateTime kLastDay = DateTime.now().add(const Duration(days: 365));
  // DateTime kLastDay = widget.estimatedTime;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay; // the day which is selected

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: widget.screenWidth * 0.03, horizontal: widget.screenWidth * 0.05,),
      margin:  EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.05,),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBoxShadow,
        borderRadius: BorderRadius.circular(widget.screenWidth * 0.05),
      ),
      child: TableCalendar(
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.green),
          weekendStyle: TextStyle(color: Colors.red),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color:kPrimaryColor.withOpacity(0.5),
          ),
          selectedDecoration: const BoxDecoration(
            color: kPrimaryColor,
          )
        ),
        firstDay: kFirstDay,
        lastDay: widget.estimatedTime,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          debugPrint('day: $_selectedDay');
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay; //is the day that the user has tapped on to select.
              _focusedDay = focusedDay; // is the day that the calendar is currently focused on.
            });
            widget.onDaySelected(selectedDay);
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}

/// the function onDaySelected is called when the user taps on a day in the calendar.
/// The function onDaySelected is called with two arguments: selectedDay and focusedDay.
/// {onDaySelected is used to handle the user's selection of a day and update the _selectedDay and _focusedDay variables.}
/// The function onPageChanged is called when the user swipes to a new page in the calendar.
/// The function onFormatChanged is called when the user changes the format of the calendar.
/// The function selectedDayPredicate is called to determine which day is currently selected.
///{selectedDayPredicate is used to determine which day should be marked as selected in the calendar based on the _selectedDay}