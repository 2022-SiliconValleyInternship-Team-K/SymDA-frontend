import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// ignore_for_file: prefer_const_constructors

final date = DateTime.now();
final year = date.year;
final month = date.month;
late int level=0;
 fetchInfo() async {
  
  var url =
      'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/diary/monthly/$year${month.toString().padLeft(2,"0")}/plant';
  final response = await http.get(Uri.parse(url));
  var responseBody = json.decode(response.body);
 
  if (response.statusCode == 200||response.statusCode == 201) {
    print(responseBody);
    level = responseBody;
    
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

  void initState() {
    super.initState();
    fetchInfo();
  }


  @override
  Widget build(BuildContext context) {
    
    
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: buildCurvedNavigationBar(),
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
                percent: level/31,
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
    int _selectedIndex = 2;
    List _selectedMenu = [
    '/diary/monthly/${date.year}${date.month}',
'/diary/monthly/${date.year}${date.month.toString().padLeft(2,"0")}/emotion',
'/diary/monthly/${date.year}${date.month.toString().padLeft(2,"0")}/plant',
  ];

  CurvedNavigationBar buildCurvedNavigationBar(){
  return CurvedNavigationBar(
      index: 2,
      height: 45,
 backgroundColor:const Color(0xffF0EAD2),
      
      buttonBackgroundColor: Colors.transparent,
      color: const Color(0xff6C584C).withOpacity(0.8),
      animationDuration: const Duration(milliseconds: 150),
      animationCurve: Curves.easeInOutQuart,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          Get.toNamed(_selectedMenu.elementAt(_selectedIndex));
        });
      },

    items: [  
  
        Icon(CupertinoIcons.add_circled_solid, size:(_selectedIndex==0)? 30:20, color:(_selectedIndex==0)? Color(0xffADC178):Color(0xffF0EAD2)),
        Icon(CupertinoIcons.calendar, size:(_selectedIndex==1)? 30:20, color:(_selectedIndex==1)? Color(0xffADC178):Color(0xffF0EAD2)),
        Icon(CupertinoIcons.tree, size:(_selectedIndex==2)? 30:20, color:(_selectedIndex==2)? Color(0xffADC178):Color(0xffF0EAD2))


  ]);
}
}
