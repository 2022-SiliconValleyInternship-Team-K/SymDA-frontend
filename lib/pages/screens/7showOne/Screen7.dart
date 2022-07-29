import 'package:flutter/material.dart';
import 'package:symda/pages/screens/7showOne/components/weatherIcon.dart';

import 'components/emotionHeader.dart';
import 'components/headerText2.dart';
import 'components/showOneBody.dart';
import 'package:symda/src/theme.dart';

class Screen7 extends StatelessWidget {
  const Screen7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      
        backgroundColor: const Color(0xffF0EAD2),
    
        body: SingleChildScrollView(
          child: Column(
           
            children: [
              SizedBox(height: h*0.05,),
              Row(
                children: [
                  HeaderText2(),
                  SizedBox(width: w*0.3,),
                 showWeather()
                ],
              ), // 상단의 '당신의 하루 ...' 문구
           // 감정스티커 모음
              SizedBox(
                width: w*0.9,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: ShowOneBody(),
                ),
              )
            ],
          ),
        ));
  }
}
