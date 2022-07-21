import 'package:flutter/material.dart';

import 'components/emotionHeader.dart';
import 'components/headerText2.dart';
import 'components/showOneBody.dart';

class Screen7 extends StatelessWidget {
  const Screen7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('일기 상세보기'),
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
