import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    // 기본: 나눔스퀘어, 일기: Yeon Sung, 코멘트: 교보손글씨2020박도연

    headline1: TextStyle(
      // 기본 글씨체
      fontFamily: "NanumSquare",
      fontSize: 18.0,
      color: Colors.black,
    ),

    headline2: TextStyle(
        fontFamily: "NanumSquare",
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.bold),

    headline3: TextStyle(
      fontFamily: "NanumSquare",
      fontSize: 14.0,
      color: Colors.black,
    ),

    bodyText1: TextStyle(
        // 감성 글씨체
        fontFamily: "NanumMyeongjo",
        fontSize: 15.0,
        color: Colors.black),

    bodyText2: TextStyle(
      fontFamily: "NanumMyeongjo",
      fontSize: 15.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),

    subtitle1: TextStyle(
        // 일기 작성 글씨체
        fontFamily: "YS",
        fontSize: 16.0,
        color: Colors.black),

    subtitle2: TextStyle(
        // 코멘트 글씨체
        fontFamily: "Kyobo",
        fontSize: 16.0,
        color: Colors.black),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
      centerTitle: false,
      color: Color(0xffF0EAD2), // F0EAD2
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ));
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xffF0EAD2),
    textTheme: textTheme(),
    appBarTheme: appTheme(),
    primaryColor: Color(0xffA98467),
  );
}
