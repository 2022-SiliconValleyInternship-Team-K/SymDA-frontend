import 'package:flutter/material.dart';
import 'package:symda_application_1/theme.dart';

class DailyQ extends StatelessWidget {
  const DailyQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Color(0xffDDE5B6),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(children: [
          IconButton(
            // 오늘의 질문 체크 박스
            icon: Icon(Icons.check_box_outline_blank_outlined),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          Column(
            children: [
              Text(
                '오늘의 질문 \n',
                style: textTheme().bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '오늘 점심은?',
                style: TextStyle(color: Color(0xff6C584C)),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
