import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    // 기본: 나눔스퀘어, 일기: Yeon Sung, 코멘트: 교보손글씨2020박도연
    headline1: GoogleFonts.nanumGothic(fontSize: 18.0, color: Colors.black),
    headline2: GoogleFonts.nanumGothic(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.nanumGothic(fontSize: 16.0, color: Colors.black),
    bodyText2: GoogleFonts.nanumMyeongjo(
        fontSize: 16.0, color: Colors.black), // 일기 글씨체 설정
    subtitle1:
        GoogleFonts.yeonSung(fontSize: 16.0, color: Colors.black), // 코멘트 글씨체 설정
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
