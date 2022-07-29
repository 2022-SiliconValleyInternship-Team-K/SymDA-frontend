import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';
import "dart:math";

var i;
  T getRandomElement<T>(List<T> list) {
  final random = new Random();
  i = random.nextInt(list.length);
  return list[i];
}
int questionid(){
  return i;
}

String rand() {
  var list = [
    '오늘 하루는 \n어땠나요?',
    '오늘 가장 생각나는 \n순간은?',
    '오늘 가장 잘 활용한 \n아이템이 있다면?',
    '오늘의 작은 기쁨은 \n무엇일까요?',
    '오늘 힘든 일은 \n없었나요?'
  ];
  var element = getRandomElement(list);
  // print(element);
  return element;
}
String dailyQ = rand();

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);
static var qeustionI=questionid();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: Color(0xffF0EAD2),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(children: [
          Text(
            '$dailyQ',
            style: TextStyle(
              fontFamily: 'NanumMyeongjo',
              fontSize: 30,
              color: Color(0xff6C584C),
              fontWeight: FontWeight.w600,
            ),
          ),
        ]),
      ),
    );
  }
}
