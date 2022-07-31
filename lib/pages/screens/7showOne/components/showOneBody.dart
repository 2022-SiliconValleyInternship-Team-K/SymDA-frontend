import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:symda/pages/screens/7showOne/components/emotionHeader.dart';
import 'package:symda/src/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import'package:symda/pages/mainCalender.dart';
var w;
var h;
var list;
class ShowOneBody extends StatefulWidget {
  const ShowOneBody({Key? key}) : super(key: key);

  @override
  State<ShowOneBody> createState() => _ShowOneBodyState();
}
   void fetchInfo() async {
    var url =
        'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/diary/date/${mainCalenderState.selectedDateTime.year}${mainCalenderState.selectedDateTime.month.toString().padLeft(2,"0")}${mainCalenderState.selectedDateTime.day.toString().padLeft(2,"0")}';
    
    final response = await http.get(Uri.parse(url));
var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
   print (responseBody);
    
    if (response.statusCode == 200||response.statusCode == 201) {
      print("서버 응답");
      list=responseBody;
    } else {
      throw Exception("정보 불러오기 실패");
    }
  }


class _ShowOneBodyState extends State<ShowOneBody> {

    void initState() {
    // TODO: implement initState
    super.initState();
    fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
      w = MediaQuery.of(context).size.width;
     h = MediaQuery.of(context).size.height;
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white70,
      
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        _buildTop(), // 윗쪽 간격 조정
        _buildDate(), // 감정스티커와 날짜
        _buildTop(), // 간격 조정
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        EmotionHeader(),
        _buildWriting(), 
        if(list["imageUrl"]!=null)
          // 일기 내용
        _buildImage(), // 일기에 첨부된 사진
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        _buildComment(), // 한 줄 코멘트
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        
        _buildMusic(), // 추천 음악
      ]),
    );
  }
}

Padding _buildTop() {
  // 간격 조정용
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 7,
      // horizontal: 16,
    ),
  );
}

Padding _buildDate() {
 
var Date = DateTime.now();
  // 날짜
  return Padding(
    
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        Text('${list["date"]} 일기',style: TextStyle(fontSize: 25,fontFamily: 'NanumMyeongjo',color:Color(0xff6C584C)),
          // 일기 작성 날짜
  
        ),
      ],
    ),
  );
}

Padding _buildWriting() {
  // 일기 내용
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        
              '${list["content"]}',
          style: TextStyle(fontFamily: 'YS',letterSpacing: 0.8,fontSize: 15,height: 1.5)
  
      ),
    ),
  );
}


Padding _buildImage() {
  // 일기에 첨부된 사진 - 크기 조정을 위해 임시로 asset에 있는 사진을 보여주도록 함
  return Padding(
    padding: EdgeInsets.only(
      left: 16,
      right: 16,
      bottom: 16,
    ),
    child:
        Image.network(
          '${list["imageUrl"]}',
          //이미지
          width: w*0.7,
          height: h*0.3,
        ),
  
  );
}

Padding _buildComment() {
  // 코멘트 내용
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(TextSpan(children: [
        TextSpan(text: '오늘의 한 마디\n\n', style: textTheme().headline2),
        TextSpan(
            style: textTheme().subtitle2,
            text: '정말 즐거웠겠다! 앞으로도 오늘 같은 날이 이어지길 바랄게:)'),
      ])),
    ),
  );
}

Padding _buildMusic() {
  // 유튜브 추천 음악
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    child: InkWell(
      child: Column(
        children: [
          Text(
            "오늘의 추천 음악을 눌러보세요",
            style: TextStyle(
                fontFamily: "Kyobo",
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Icon(Icons.library_music_rounded,color: Colors.red,size: 35,)
        ],
      ),

    ),
  );
}
