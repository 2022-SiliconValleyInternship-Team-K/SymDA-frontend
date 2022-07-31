import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
final date = DateTime.now();
final year = date.year;
final month = date.month;
var list;
var length=0;
class ShowAllBody extends StatefulWidget {
  const ShowAllBody({Key? key}) : super(key: key);

  @override
  State<ShowAllBody> createState() => _ShowAllBodyState();
}
   void fetchInfo() async {
    var url =
        'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/diary/monthly/$year${month.toString().padLeft(2,"0")}';
    final response = await http.get(Uri.parse(url));
   
    list = jsonDecode(utf8.decode(response.bodyBytes));
  
    if(list !=null){
      length = list.length;
    }
    
    if (response.statusCode == 200||response.statusCode == 201) {
      print("서버 응답");
    } else {
      print(response.statusCode);
      throw Exception("정보 불러오기 실패");
    }
  }

class _ShowAllBodyState extends State<ShowAllBody> {
   void initState() {
    super.initState();
    fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Center(
        
   
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(), 
               scrollDirection: Axis.vertical,
          shrinkWrap: true,
            crossAxisCount: 1,
            mainAxisSpacing: 15,
          padding: EdgeInsets.all(10.0),
          children: getList(),
          ),
        
      );
   

  }
  
 List<Widget> getList() {
  
List<Widget> childs = [];

if(length==0){
 
   childs.add(Text("작성한 일기가 없습니다.",style: TextStyle(color:const Color(0xff6C584C),fontSize: 18,fontFamily: 'NanumSquare'),));
   return childs;
}
else{
 
  for(var i=0;i<length;i++){
  childs.add(diary(i));
  
}

return childs;

}


 }
}

Container diary(int i){
      return Container(
     decoration: BoxDecoration(
        color: Colors.white70,
      
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          _buildTop(), // 윗쪽 간격 조정
          _buildEmotion(i), // 감정스티커와 날짜
          _buildTop(), // 간격 조정
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          _buildWriting(i), // 일기 내용
          _buildImage(i), 
          // 일기에 첨부된 사진
        ]),
      ),
    );
}

Padding _buildTop() {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 5,
     
    ),

  );
}

Padding _buildEmotion(int i) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        CircleAvatar(
          // 감정 스티커 작게 보이게
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('src/images/emotions/${list[i]["emotion"]}.png'),
        ),
        SizedBox(
          // 감정 스티커와 날짜 사이의 간격 조정
          width: 10,
        ),
        Text.rich(
          // 일기 작성 날짜
          TextSpan(
            children: [
              TextSpan(text: '${list[i]["createdAt"]}', style: TextStyle(fontFamily: 'YS',letterSpacing: 0.8,fontSize: 15,height: 1.5)),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding _buildWriting(int i) {
  // 일기 내용
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 16,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '${list[i]["content"]}',
        style: textTheme().subtitle1,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
      ),
    ),
  );
}


Widget _buildImage(int i) {
  if(list[i]["imageUrl"] !=null){
  return Padding(
    padding: EdgeInsets.only(
      left: 16,
      right: 16,
      bottom: 16,
    ),
    child: Image.network(
      '${list[i]["imageUrl"]}',
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );}
  
  return SizedBox(height:10);
}
