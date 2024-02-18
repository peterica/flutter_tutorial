import 'package:flutter/material.dart';
// 웹뷰 플러그인
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  // 컨트롤러 변수
  WebViewController? controller;

  // 생성자
  HomeScreen({Key? key}) : super(key: key);

  // 웹뷰 연동하기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 홈 버튼 구현하기
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('피터의 개발이야기'),
        centerTitle: true,

        // 홈버튼 액션
        actions: [
          IconButton(
            onPressed: () {
              if (controller != null) {
                controller!.loadUrl('https://peterica.tistory.com');
              }
            },
            // 홈버튼 아이콘 생성
            icon: Icon(Icons.home)),
        ],
      ),
      body: WebView(
        // 위젯에 컨트롤러 생성
        onWebViewCreated: (WebViewController controller){
          this.controller = controller;
        },
        initialUrl: 'https://peterica.tistory.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}