import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen());
}

// Container와 BoxDecoration 사용방법
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Center(
            child: Text('Splash Screen'),
          ),
        )
      ),
    );
  }
}