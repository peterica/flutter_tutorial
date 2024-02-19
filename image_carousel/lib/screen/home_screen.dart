import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Page View 구현하기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [1,2,3,4,5]
            .map(
                (number) => Image.asset('asset/img/image_$number.jpeg'),
        ).toList(),
      ),
    );
  }
}