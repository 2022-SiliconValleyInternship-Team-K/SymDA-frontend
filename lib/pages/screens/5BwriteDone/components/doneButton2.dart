import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:symda/src/theme.dart';

class DoneButton2 extends StatelessWidget {
  final String? text;
  final GestureTapCallback? press;

  const DoneButton2({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/EmotionSelect'); // 버튼 눌렀을 때 이동할 페이지
        },
        child: Center(
          child: Text(
            "다 적었어요!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "NanumSquare",
              fontSize: 18.0,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: theme().primaryColor,
          // padding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
