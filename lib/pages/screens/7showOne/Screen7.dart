import 'package:flutter/material.dart';

import 'components/emotionHeader.dart';
import 'components/headerText2.dart';
import 'components/showOneBody.dart';
import 'package:symda/src/theme.dart';

class Screen7 extends StatelessWidget {
  const Screen7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),
        appBar: AppBar(
          // title: Text('일기 상세보기'),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Color(0xffF0EAD2),
        ),
        body: ListView(
          children: [
            HeaderText2(), // 상단의 '당신의 하루 ...' 문구
            EmotionHeader(), // 감정스티커 모음
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: ShowOneBody(),
            )
          ],
        ));
  }
}
