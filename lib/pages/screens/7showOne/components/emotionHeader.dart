import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:symda/pages/screens/7showOne/components/emotionHeader.dart';
var list;
// 5.4에서 감정 스티커가 보이는 공간


class EmotionHeader extends StatefulWidget {
  const EmotionHeader({Key? key}) : super(key: key);

  @override
  State<EmotionHeader> createState() => _EmotionHeaderState();
}

class _EmotionHeaderState extends State<EmotionHeader> {
  @override
  Widget build(BuildContext context) {
     var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Card(
      color:Colors.white70,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: 
       
             
                Container(
                  alignment: Alignment.center,
                  child: Column(
        
                    children: [
                    
                        Image.asset(
                          'src/images/emotions/${list[0]["emotion"]}.png',
                          width: w*0.25,
                          height: h*0.2,
                        )
                      
                    ],
                  ),
                ),

          
            
        
    );
  }

}
