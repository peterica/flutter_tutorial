import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:get_it/get_it.dart';

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
      // 새 일정 버튼
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(
              // 선택한 날짜 넘겨주기
              selectedDate: selectedDate,
            ),
            // 키보드 가림 해결
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(   // 시스템 UI 피해서 UI 구현
        child: Column(  // 달력과 리스트를 세로로 배치
          children: [
            // 메인 달력 연결
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8),
            // 선택 일정 갯수 표시
            TodayBanner(
              selectedDate: selectedDate,
              count: 0,
            ),
            SizedBox(height: 8),
            Expanded(   // 남는 공간을 모두 차지하기
              // database의 데이터가 stream으로 넘어옴.
              child: StreamBuilder<List<Schedule>>(
                stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                builder: (context, snapshot) {

                  // 데이터가 없을 때 빈 컨테이너 전달
                  if(!snapshot.hasData){
                    return Container();
                  }

                  // 화면 랜더링
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final schedule = snapshot.data![index];

                      return Dismissible(
                        key: ObjectKey(schedule.id), // 유니크 키값
                        direction: DismissDirection.startToEnd, // 왼쪽에서 오른쪽으로 밀기
                        onDismissed: (DismissDirection direction){
                          GetIt.I<LocalDatabase>()
                              .removeSchedule(schedule.id);
                        },

                        child: Padding( // UI개선, 좌우로 패딩
                          padding: const EdgeInsets.only( bottom: 8, left: 8 ),
                          child: ScheduleCard(
                            startTime: schedule.startTime,
                            endTime: schedule.endTime,
                            content: schedule.content,
                          ),
                        ),

                      );
                    },
                  );
                },
              )
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