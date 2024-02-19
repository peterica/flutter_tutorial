import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // 프로젝트 초기세팅
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // https://api.flutter.dev/flutter/widgets/Text-class.html
      // 응용한 Text 출력
      body: const Center(
        child: SelectionArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('This is the way!!'),
            ],
          ),
        ),
      ),
    );
  }
}