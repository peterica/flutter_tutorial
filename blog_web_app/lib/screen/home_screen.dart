import 'package:flutter/material.dart';
// 웹뷰 플러그인
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  // 생성자
  HomeScreen({Key? key}) : super(key: key);

  // 웹뷰 연동하기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://peterica.tistory.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}