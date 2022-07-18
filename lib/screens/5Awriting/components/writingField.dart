// 텍스트필드를 따로 작성하면 좋을 것 같아서 따로 파일을 만들었는데
// 계속 오류가 나서 Screen5A에 바로 텍스트필드를 넣었습니다.

import 'package:flutter/material.dart';

class WritingField extends StatelessWidget {
  const WritingField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: ListView(
      children: [
        TextField(
          decoration: InputDecoration(
              labelText: '오늘 하루는?', fillColor: Colors.white, filled: true),
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLines: 5,
        ),
      ],
    )));
  }
}
