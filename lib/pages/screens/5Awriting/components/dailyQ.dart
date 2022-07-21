import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';


class DailyQ extends StatefulWidget {
  const DailyQ({Key? key}) : super(key: key);

  @override
  State<DailyQ> createState() => _DailyQState();
}

class _DailyQState extends State<DailyQ> {
  String dailyQ = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Color(0xffDDE5B6),
      child: SingleChildScrollView(
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
                  '$dailyQ',
                  style: TextStyle(color: Color(0xff6C584C)),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
