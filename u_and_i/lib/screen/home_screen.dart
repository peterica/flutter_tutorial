import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    return Column(
      children: [
        const SizedBox(height: 80),
        Text('U&I'),
        const SizedBox(height: 16),
        Text('우리 처음 만난 날'),
        Text('2024.02.20'),
        const SizedBox(height: 16),
        IconButton(
          iconSize: 60,
          onPressed: (){},
          icon: Icon(
            Icons.favorite,
          ),
        ),
        const SizedBox(height: 16),
        Text('D+365'),
      ],
    );
  }
}

// 커플이미지 구성
class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'asset/img/middle_image.png',

        // 화면 반만큼 높이 설정
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}