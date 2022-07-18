import 'package:flutter/material.dart';
import 'package:symda_application_1/screens/7showOne/components/emotionHeader.dart';
import 'package:symda_application_1/screens/7showOne/components/headerText2.dart';
import 'package:symda_application_1/screens/7showOne/components/showOneBody.dart';

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
            HeaderText2(),
            EmotionHeader(),
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: ShowOneBody(
                  // showAll: showAllList[0], // 일기가 여러 개이면 여러 개 보여줌
                  ),
            )
          ],
        ));
  }
}
