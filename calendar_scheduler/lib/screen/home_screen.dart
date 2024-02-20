import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/main_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(   // 시스템 UI 피해서 UI 구현
        child: Column(  // 달력과 리스트를 세로로 배치
          children: [
            // 메인 달력 연결
            MainCalendar(),
          ],
        ),
      ),
    );
  }
}