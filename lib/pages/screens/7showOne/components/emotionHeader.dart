import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import'package:symda/pages/mainCalender.dart';
var list;
// 5.4에서 감정 스티커가 보이는 공간


class EmotionHeader extends StatefulWidget {
  const EmotionHeader({Key? key}) : super(key: key);

  @override
  State<EmotionHeader> createState() => _EmotionHeaderState();
}
   void fetchInfo() async {
    var url =
        'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/diary/date/${mainCalenderState.selectedDateTime.year}${mainCalenderState.selectedDateTime.month.toString().padLeft(2,"0")}${mainCalenderState.selectedDateTime.day.toString().padLeft(2,"0")}';
    final response = await http.get(Uri.parse(url));
   
var responseBody = json.decode(response.body);
  
    
    if (response.statusCode == 200||response.statusCode == 201) {
      print("서버 응답");
      list = responseBody;
    } else {
      throw Exception("정보 불러오기 실패");
    }
  }

class _EmotionHeaderState extends State<EmotionHeader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInfo();
  }
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
                          'src/images/emotions/${list["emotion"]}.png',
                          width: w*0.25,
                          height: h*0.2,
                        )
                      
                    ],
                  ),
                ),

          
            
        
    );
  }

}
