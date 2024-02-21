import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/main_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 선택된 날짜 관리 변수
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(   // 시스템 UI 피해서 UI 구현
        child: Column(  // 달력과 리스트를 세로로 배치
          children: [
            // 메인 달력 연결
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달
              onDaySelected: onDaySelected,
            ),
            // 일정 카드
            ScheduleCard(
                startTime: 12,
                endTime: 15,
                content: '일정을 샘플로 만들어보기'
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    // 날짜 선택 시 실행함수
    setState(() {
      this.selectedDate = selectedDate;
    });

  }
}