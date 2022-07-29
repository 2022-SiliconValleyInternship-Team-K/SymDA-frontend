import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symda/pages/screens/5Awriting/components/headerText.dart';
import 'package:symda/pages/screens/5Awriting/components/imageGal.dart';
import 'package:symda/pages/screens/5Awriting/components/weather.dart';
import 'package:symda/pages/screens/5Awriting/components/writingField.dart';

import 'package:http/http.dart' as http;

class EmotionSelect extends StatefulWidget {
  const EmotionSelect({Key? key}) : super(key: key);

  @override
  State<EmotionSelect> createState() => _EmotionSelectState();
}

class _EmotionSelectState extends State<EmotionSelect> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                '심다가 실수를 했군요 :( \n당신의 오늘 하루는 어땠나요?',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'NanumMyeongjo',
                    color: Color(0xff6C584C),
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmotionsIcon('JOY',w*0.2),
                  EmotionsIcon(
                    'ANGER',w*0.2
                  ),
                  EmotionsIcon('FEAR',w*0.2),
                  EmotionsIcon(
                    'SAD',w*0.2
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  Center EmotionsIcon(String s,double w) {
    String etext;
    if (s == 'JOY') {
      etext = '행복';
    } else if (s == 'SAD') {
      etext = '슬픔';
    } else if (s == 'ANGER') {
      etext = '화남';
    } else {
      etext = '불안';
    }
    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: () async {
             await showDialog(context: context, builder: (BuildContext context){
                  return  AlertDialog(content:Text("'$etext'을 선택하신게 맞나요?",
                  style:TextStyle(fontFamily: 'NanumSquare',color: Color(0xff6C584C),fontSize: 18)
                   ), 
                   
                   backgroundColor: const Color(0xffF0EAD2),
                actions: [Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 50),primary:const Color(0xffADC178),), 
                        onPressed: () { 
                           onPressed: () async {
        if (s == '아니요') {
          Navigator.pushNamed(context, '/EmotionSelect');
        } else {
                           var data = {
                      "content":WritingFieldState.inputText,
                      "weather":WeatherState.w,
                      "emotion":s,
                      "questionId":HeaderText.qeustionI,
                      "image":ImagePicState.Pimage
                    };
          var body = json.encode(data);
                   http.Response _res = await http.post(
              Uri.parse(
                  'http://ec2-13-209-3-136.ap-northeast-2.compute.amazonaws.com:8080/diary/new'),
              body: body);
          if (_res.statusCode == 200) {
         Get.toNamed('/diary/date/${DateTime.now().year}${DateTime.now().month.toString().padLeft(2,"0")}${DateTime.now().day.toString().padLeft(2,"0")}');
            print('Form is valid');
          } else {
            print(_res.statusCode);
        
          }
        }
                          
                           }; },
                      child:Text('네',style:TextStyle(fontFamily: 'NanumSquare',fontWeight: FontWeight.bold)) ),
                      Padding(padding: EdgeInsets.only(left: 15)),
                      ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 50),primary:const Color(0xffADC178)),
                        onPressed: () { 
                          Navigator.of(context).pop();
                           },
                           
                      child:Text('아니오',style:TextStyle(fontFamily: 'NanumSquare',fontWeight: FontWeight.bold)) ),
                    ],
                  ),
                )],); 
                });
              },
              icon: Image.asset('src/images/emotions/$s.png'),
              iconSize: w),
          Text(etext,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'NanumSquare',
                color: Color(0xffA98467),
              ))
        ],
      ),
    );
  }
}
