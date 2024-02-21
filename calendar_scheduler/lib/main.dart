import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:get_it/get_it.dart';


// Table Calendar 사용법
void main()  async {
  // 플러터 프레임 Ready 대기
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(); // DateFormat 다국어 지원

  // 드리프트 초기화
  final database = LocalDatabase(); // 데이터베이스 생성

  // GetIt에 데이터베이스 주입
  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(
    MaterialApp(
      home: HomeScreen(),
      /*home: Scaffold(
        // Calendar 위젯
        body: TableCalendar(

          // min Date
          firstDay: DateTime(2000,1,1),

          // max Date
          lastDay: DateTime(2025,12,31),

          // 표시되는 날짜
          focusedDay: DateTime.now(),

          // 선택한 날짜를 인식하는 함수
          selectedDayPredicate: (DateTime day){
            final now = DateTime.now();
            return DateTime(day.year, day.month, day.day).isAtSameMomentAs(
              DateTime(now.year,now.month,now.day),
            );
          },

          // 날짜 선택 시
          onDaySelected: (DateTime selectedDay, DateTime focusedDay){
            print('onDaySelected');
          },

          // 날짜 변경 시
          onPageChanged: (DateTime focusedDay){
            print('onPageChanged');
          },

          // 기간 선택 모드
          rangeSelectionMode: RangeSelectionMode.toggledOn,

          // 기간 선탠 시
          onRangeSelected: (DateTime? start, DateTime? end, DateTime focusedDay){
            print('rangeSelectionMode');
          },

        ),

      ),*/
    )
  );
}

