import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  // 홈 스크린 UI 구현하기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          // 위아래 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //  반대축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 하트 기능을 주입
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay, // 시작일 주
            ),
            _CoupleImage(),
          ],
        ),
      ),

      // https://api.flutter.dev/flutter/widgets/Text-class.html
      // 응용한 Text 출력
      /*body: const Center(
        child: SelectionArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('This is the way!!'),
            ],
          ),
        ),
      ),*/
    );
  }

  // 하트 기능 생성
  void onHeartPressed(){
    // 쿠퍼티노 다이어로그 생성자
    showCupertinoDialog(

      context: context,
      builder: (BuildContext context){
        // 날짜 다이얼로그 정렬
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white, // 흰색 배경
            height: 300,
            child: CupertinoDatePicker(
              // 시간 빼고 날짜만 선택
              mode: CupertinoDatePickerMode.date,
              // 선택한 날짜 데이터 받아 firstDay에 반경하기
              onDateTimeChanged: (DateTime date){
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true, // 외부 클릭 시 닫음
    );
  }

}

// _DDay 위젯
class _DDay extends StatelessWidget {

  final GestureTapCallback onHeartPressed;
  final DateTime firstDay; // 시작일 생성

  // 하트 기능을 부모에서 주입받는다.
  _DDay({
    required this.onHeartPressed,
    required this.firstDay, // 시작일 입력받기
  });

  @override
  Widget build(BuildContext context) {

    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now(); // 현재 시간 생성

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          'U&I',
          style: textTheme.headlineLarge,
        ),
        const SizedBox(height: 10),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyMedium,
        ),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        IconButton(
          iconSize: 60,
          onPressed: onHeartPressed, // 하트 기능을 버튼에 주입
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays+1}',
          style: textTheme.headlineMedium,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

// 커플이미지 구성
class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded( // 오버플로 해결 => Expanded
      child: Center(
        child: Image.asset(
          'asset/img/middle_image.png',

          // 화면 반만큼 높이 설정
          height: MediaQuery.of(context).size.height / 2,
        ),
      )
    );
  }
}