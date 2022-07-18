import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:symda_application_1/screens/5Awriting/components/dailyQ.dart';
import 'package:symda_application_1/screens/5Awriting/components/doneButton.dart';
import 'package:symda_application_1/screens/5Awriting/components/headerText.dart';
import 'package:symda_application_1/screens/5Awriting/components/weather.dart';
import 'package:symda_application_1/screens/5Awriting/components/writingField.dart';

class Screen5A extends StatelessWidget {
  const Screen5A({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일기 작성'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: ListView(children: [
            HeaderText(),
            DailyQ(), // 오늘의 질문
            Weather(), // 오늘의 날씨는?
            TextFormField(
              // 일기 작성란
              decoration: InputDecoration(
                  labelText: '오늘 하루는?', fillColor: Colors.white, filled: true),
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: 5,
            ),
            // WritingField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _IMGfromGal(),
                _IMGfromCam(),
              ],
            ),
            DoneButton(), // 작성 완료 버튼
          ]),
        ),
      ),
    );
  }
}

Widget _IMGfromGal() {
  return Container(
    color: Colors.pink,
    height: 80,
    width: 80,
  );
}

Widget _IMGfromCam() {
  return Container(
    color: Colors.pink,
    height: 80,
    width: 80,
  );
}
