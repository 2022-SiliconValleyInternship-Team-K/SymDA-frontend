import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:symda/pages/emotionSelect.dart';
import 'package:symda/pages/screens/5Awriting/components/headerText.dart';
import 'package:symda/pages/screens/5Awriting/components/imageGal.dart';
import 'package:symda/pages/screens/5Awriting/components/weather.dart';
import 'package:symda/pages/screens/5Awriting/components/writingField.dart';

// ignore_for_file: prefer_const_constructors

 String emotion='';

 


   Future<String>  fetchInfo() async {
     var url =
      'http://ec2-3-34-4-46.ap-northeast-2.compute.amazonaws.com:5000/emotion';
    var data = {
                      "content":WritingFieldState.inputText,
                    };
          var body = json.encode(data);
                   http.Response _res = await http.post(
              Uri.parse(url),
              body: body,headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
        var responseBody =jsonDecode(json.encode(_res.body));
        print(responseBody);
          if (_res.statusCode == 200||_res.statusCode == 201) {
              
        return responseBody;
        
          } else {
            print(_res.statusCode);
        
          }

     throw Exception("오류");
 


}
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
              FutureBuilder(
                future:fetchInfo(),
                builder:(BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData==false){
                    return CircularProgressIndicator();
                  }else if(snapshot.hasError){
                          return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),);
                  }else{
                    return Emotions(snapshot.data.toString());
                  }

                } ),
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
    if (s == 'JOY') {
      etext = '행복';
    } else if (s == 'SAD') {
      etext = '슬픔';
    } else if (s == 'ANGER') {
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
          Get.to(() => EmotionSelect());
        } else {
                           var data = {
                      "content":WritingFieldState.inputText,
                      "weather":WeatherState.w,
                      "emotion":emotion,
                      "questionId":HeaderText.qeustionI,
                      "image":ImagePicState.Pimage
                     
                    };
          var body = json.encode(data);
                   http.Response res = await http.post(
              Uri.parse(
                  'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/diary/new'),
              body: body,headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
          if (res.statusCode == 200||res.statusCode == 201) {
         Get.toNamed('/diary/date/:date');
            print('Form is valid');
          } else {
            print(res.statusCode);
        
          }
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
