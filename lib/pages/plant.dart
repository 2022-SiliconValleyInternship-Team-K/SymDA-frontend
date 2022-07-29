import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// ignore_for_file: prefer_const_constructors

final date = DateTime.now();
final year = date.year;
final month = date.month;

Future<dynamic> fetchInfo() async {
  var url =
      'http://ec2-13-209-3-136.ap-northeast-2.compute.amazonaws.com:8080/diary/monthly/$year$month/plant';
  final response = await http.get(Uri.parse(url));
  var responseBody = response.body;
  if (response.statusCode == 200) {
    print("서버 응답");
    return responseBody;
  } else {
    throw Exception("식물 정보 불러오기 실패");
  }
}

class plant extends StatefulWidget {
  const plant({Key? key}) : super(key: key);

  @override
  State<plant> createState() => _plantState();
}

class _plantState extends State<plant> {
  int? level;

  void initState() {
    super.initState();
   level = fetchInfo() as int?;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "감정 나무",
                style: TextStyle(
                    color: Color(0xff6C584C),
                    fontFamily: 'NanumSquare',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: h * 0.1,
              ),
              LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                width: w - 60,
                animation: true,
                lineHeight: h * 0.03,
                animationDuration: 2500,
                percent: level!/31,
                center: Text(
                  "$level/31",
                  style: const TextStyle(fontSize: 12.0),
                ),
                trailing: const Icon(
                  CupertinoIcons.tree,
                  color: const Color(0xffADC178),
                ),
                backgroundColor: const Color(0xffA98467).withOpacity(0.4),
                progressColor: const Color(0xffADC178),
              ),
              Image.asset(
                'src/images/plants/$level.png',
                height: h * 0.45,
              ),
              Container(
                alignment: Alignment.center,
                width: w * 0.82,
                height: h * 0.12,
                decoration: BoxDecoration(
                    color: Color(0xff6C584C).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(18)),
                child: Text(
                  "일기를 쓸 때마다 쑥쑥 자라나는 감정나무예요.\n당신의 하루를 꾸준히 공유해 감정나무를 키워보세요!",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: 'NanumSquare',
                      letterSpacing: 0.5,
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
