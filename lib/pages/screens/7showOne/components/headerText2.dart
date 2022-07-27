import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';

class HeaderText2 extends StatelessWidget {
  const HeaderText2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: Color(0xffF0EAD2),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(children: [
          Text(
            '당신의 하루 . . .',
            style: TextStyle(
              fontFamily: 'NanumMyeongjo',
              fontSize: 30,
              color: Color(0xff6C584C),
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
