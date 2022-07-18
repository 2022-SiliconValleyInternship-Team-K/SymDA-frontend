import 'package:flutter/material.dart';
import 'package:symda_application_1/screens/5Awriting/components/doneButton.dart';
import 'package:symda_application_1/screens/5Awriting/components/headerText.dart';
import 'package:symda_application_1/screens/5Awriting/components/weather.dart';
import 'package:symda_application_1/screens/5BwriteDone/components/doneButton2.dart';
import 'package:symda_application_1/screens/5BwriteDone/components/writingDoneBody.dart';

class Screen5B extends StatelessWidget {
  const Screen5B({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일기 작성 완료 화면'),
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: ListView(children: [
                HeaderText(),
                Weather(), // 오늘의 날씨는?
                DoneBody(),
                DoneButton2(), // 작성 완료 버튼
              ]))),
    );
  }
}
