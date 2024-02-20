import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // 한글 다이어그램 지정
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,   // for 안드로이드
        GlobalCupertinoLocalizations.delegate,  // for IOS
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
        const Locale('en', "US"),
      ],
      theme: ThemeData(  // 테마를 지정
          /*
            https://api.flutter.dev/flutter/material/ThemeData-class.html
            fontFamily  : 기본 글씨체
            textTheme   : Text 위젯 테마를 지정
            tabBarTheme : TabBar 위젯의 테마를 지정
            cardTheme   : Card 위젯의 테마를 지정
            appBarTheme : AppBar 위젯의 테마를 지정
            floatingActionButtonTheme: FloatingActionButton 위젯의 테마
            elevatedButtonTheme: ElevatedButton 위젯의 테마
            checkboxTheme: CheckBox 위젯의 테마
          */
          fontFamily: 'sunflower',  // 기본 글씨체
          textTheme: TextTheme(     // 글짜 테마 적용
            headlineLarge: TextStyle(   //  headline1 스타일 정의
              color: Colors.white,  //  글 색상
              fontSize: 80.0,       //  글 크기
              fontWeight: FontWeight.w700, //  글 두께
              fontFamily: 'parisienne',    //  글씨체
            ),
            headlineMedium: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )
      ),
      home: HomeScreen(),
    )
  );
}