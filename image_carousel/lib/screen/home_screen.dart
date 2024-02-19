import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async'; // Timer 참조 import

// StatefulWidget 바꾸기
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // page 컨트롤러 생성
  final PageController pageController = PageController();

  // 타이머 추가
  @override
  void initState() {
    super.initState(); // 부모 initState를 실행한다

    Timer.periodic(
      Duration(seconds: 3),
      (timer) {

        int? nextPage = pageController.page?.toInt();

        // 페이지 null 예외처리
        if (nextPage == null){
          return;
        }

        // 로테이션 로직
        if (nextPage == 4) {
          nextPage=0;
        } else {
          nextPage++;
        }

        // 페이지 전환 에니메이션 적용
        pageController.animateToPage(
          nextPage,
          duration: Duration(microseconds: 500),
          curve: Curves.ease,);
      },
    );
  }

  // Page View 구현하기
  @override
  Widget build(BuildContext context) {
    // 상태바 색상 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
        controller: pageController, // PageController 주입
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