import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Page View 구현하기
  @override
  Widget build(BuildContext context) {
    // 상태바 색상 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
        children: [1,2,3,4,5]
            .map(
                (number) => Image.asset(
                  'asset/img/image_$number.jpeg',
                  fit: BoxFit.cover,
                ),
        ).toList(),
      ),
    );
  }
}