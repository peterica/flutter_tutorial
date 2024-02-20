import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {

  Widget build(BuildContext context) {
    // 달력 구현하기
    return TableCalendar(
      firstDay: DateTime(1800,1,1), // min Date
      lastDay: DateTime(3000,1,1),  // max Date
      focusedDay: DateTime.now(),   // now Date
    );
  }
}
