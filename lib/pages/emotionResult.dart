import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// ignore_for_file: prefer_const_constructors

class EmotionResult extends StatefulWidget {
  @override
  State<EmotionResult> createState() => _EmotionResultState();
}

class _EmotionResultState extends State<EmotionResult> {
  
  @override
  Widget build(Object context) {
    
    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '심다가 생각하는 \n당신의 오늘 하루는',
                style: TextStyle(
                  height: 1.4,
                  fontSize: 22,
                  fontFamily: 'NanumMyeongjo',
                  color: const Color(0xff6C584C),
                ),
                textAlign: TextAlign.center,
              ),
              Emotions('joy'),
              Padding(padding: EdgeInsets.only(top: 30)),
              Text(
                '저희의 분석이 맞을까요?',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'NanumMyeongjo',
                  color: const Color(0xff6C584C),
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  emotionCheckButton("네"),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  emotionCheckButton("아니요")
                ],
              ))
            ]),
          ),
          
        ),

        );
        
  }
  

  Column Emotions(String s) {
    String etext;
    if (s == 'joy') {
      etext = '행복';
    } else if (s == 'sad') {
      etext = '슬픔';
    } else if (s == 'anger') {
      etext = '화남';
    } else {
      etext = '불안';
    }
    return Column(
      children: [
        Image.asset(
          'src/images/emotions/$s.png',
          width: 200,
          height: 200,
        ),
        Text(
          etext,
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'NanumSquare',
              color: const Color(0xffA98467)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  ElevatedButton emotionCheckButton(String s) {
    return ElevatedButton(
      onPressed: () async {
        if (s == '아니요') {
          Navigator.pushNamed(context, '/EmotionSelect');
        } else {

        }
      },
      child: Text(s),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(130, 45),
        maximumSize: Size(130, 45),
        elevation: 5,
        primary: Color(0xffADC178),
        onPrimary: Colors.white,
        textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'NanumSquare'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
