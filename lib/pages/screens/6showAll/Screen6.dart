import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/showAllBody.dart';
import 'package:symda/src/theme.dart';
   final date = DateTime.now();
class Screen6 extends StatefulWidget {
  const Screen6({Key? key}) : super(key: key);

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {

      void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
       var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: buildCurvedNavigationBar(),
        backgroundColor: const Color(0xffF0EAD2),

        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: h*0.05,),
                 Text("일기 모아보기",style: TextStyle(color:const Color(0xff6C584C),fontSize: 25,fontFamily: 'NanumMyeongjo')),
                  SizedBox(
                  width: w*0.85,
                      child: ShowAllBody(
            
                          ),
                    ),]
              ),
            ),
          ),
        )
      
        );
  }

      int _selectedIndex = 0;

    List _selectedMenu = [
    '/diary/monthly/${date.year}${date.month}',
'/diary/monthly/${date.year}${date.month.toString().padLeft(2,"0")}/emotion',
'/diary/monthly/${date.year}${date.month}/plant',
  ];

  CurvedNavigationBar buildCurvedNavigationBar(){
  return CurvedNavigationBar(
      index: 0,
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
