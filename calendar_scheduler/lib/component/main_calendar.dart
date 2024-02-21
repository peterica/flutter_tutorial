import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_scheduler/const/colors.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected; // 날짜 선택 시 실행할 함수
  final DateTime selectedDate; // 선택된 날짜

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
  });

  Widget build(BuildContext context) {
    // 달력 구현하기
    return TableCalendar(
      // 한국어
      locale: 'ko_kr',

      // 날짜 선택 시 실행
      onDaySelected: onDaySelected,

      // 선택된 날짜 분기로직
      selectedDayPredicate: (date) =>
        date.year == selectedDate.year &&
        date.month == selectedDate.month &&
        date.day == selectedDate.day,

      firstDay: DateTime(1800,1,1), // min Date
      lastDay: DateTime(3000,1,1),  // max Date
      focusedDay: DateTime.now(),   // now Date
      headerStyle: HeaderStyle(       // 달력 최상단 스타일
        titleCentered: true,          // 제목 중앙정렬
        formatButtonVisible: false,   // 달력 크기 선택 옵션 없애기
        titleTextStyle: TextStyle(    // 제목 글꼴
          fontWeight: FontWeight.w700,
          fontSize: 16,
        )
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(  // 기본 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        weekendDecoration: BoxDecoration(  // 주말 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        selectedDecoration: BoxDecoration(  // 선택된 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: TextStyle(  // 기본 글꼴
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(  // 주말 글꼴
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        selectedTextStyle: TextStyle(  // 선택된 날짜 글꼴
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
