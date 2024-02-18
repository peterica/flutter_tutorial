import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen());
}

// image 추가 방법
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset('assets/main_intro.png'),
          ),
        )
      ),
    );
  }
}