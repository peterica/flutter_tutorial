import 'package:flutter/material.dart';

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
            _DDay(),
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
}

// _DDay 위젯
class _DDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;

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
          '2024.02.20',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        IconButton(
          iconSize: 60,
          onPressed: (){},
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'D+365',
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