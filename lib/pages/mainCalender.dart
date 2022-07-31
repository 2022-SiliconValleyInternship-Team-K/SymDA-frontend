
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final date = DateTime.now();
final year = date.year;
final month = date.month.toString().padLeft(2,"0");
var length=0;
var list;
var url;

class mainCalender extends StatefulWidget {
  @override
  State<mainCalender> createState() => mainCalenderState();
}

enum CalendarViews { dates, months, year }

class mainCalenderState extends State<mainCalender> {
  void fetchInfo() async {
    url =
        'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/diary/monthly/${currentDateTime.year}${currentDateTime.month.toString().padLeft(2,"0")}/emotion';
    final response = await http.get(Uri.parse(url));
    var responseBody = response.body;
    list = jsonDecode(responseBody);
    if(list!=null){
      length = list.length;

    }
    
    if (response.statusCode == 200||response.statusCode == 201) {
      print(length);
    } else {
      throw Exception("감정 정보 불러오기 실패");
    }
  }

  
 static late DateTime currentDateTime;
  static late DateTime selectedDateTime;
  late List<Calendar> _sequentialDates;
  late int midYear;
  CalendarViews _currentView = CalendarViews.dates;
  final List<String> _weekDays = ['일', '월', '화', '수', '목', '금', '토'];
  final List<String> _monthNames = [
    '01월',
    '02월',
    '03월',
    '04월',
    '05월',
    '06월',
    '07월',
    '08월',
    '09월',
    '10월',
    '11월',
    '12월'
  ];

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    currentDateTime = DateTime(date.year, date.month);
    selectedDateTime = DateTime(date.year, date.month, date.day);
    setState(() => _getCalendar());
     fetchInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
     bottomNavigationBar: buildCurvedNavigationBar(),
      backgroundColor: const Color(0xffF0EAD2),
      body: Center(
        child: SizedBox(
          width: w * 0.9,
          height: h * 0.9,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "당신의 한달은 \n어땠을까요?",
                        style: TextStyle(
                          fontFamily: 'NanumMyeongjo',
                          fontSize: 28,
                          color: Color(0xff6C584C),
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  _datesView()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _datesView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // header
        Row(
          children: <Widget>[
            // prev month button
            _toggleBtn(false),
            // month and year
            Expanded(
              child:  InkWell(
                  onTap: () =>
                      setState(() => _currentView = CalendarViews.months),
                  child: Center(
                    child: Text(
                      _monthNames[currentDateTime.month - 1],
                      style: TextStyle(
                          color: Color(0xffADC178),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
            ),
            // next month button
            _toggleBtn(true),
          ],
        ),

        const SizedBox(
          height: 10,
        ),
        Flexible(
            child: Column(
          children: [
            _calendarBodyWeek(),
            const SizedBox(
              height: 5,
            ),
            _calendarBody(),
          ],
        )),
      ],
    );
  }

  // next / prev month buttons
  Widget _toggleBtn(bool next) {
    return InkWell(
        onTap: () {
          if (_currentView == CalendarViews.dates) {
            setState(() => (next) ? _getNextMonth() : _getPrevMonth());
          } else if (_currentView == CalendarViews.year) {
            if (next) {
              midYear =
                  (midYear == null) ? currentDateTime.year + 9 : midYear + 9;
            } else {
              midYear =
                  (midYear == null) ? currentDateTime.year - 9 : midYear - 9;
            }
            setState(() {});
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child: Icon(
            (next) ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
            color: const Color(0xffADC178),
            size: 15,
          ),
        ),
      );
  }

  // calendar
  Widget _calendarBody() {
    if (_sequentialDates == null) return Container();
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: _sequentialDates.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 5 / 12,
        mainAxisSpacing: 10,
        crossAxisCount: 7,
        crossAxisSpacing: 18,
      ),
      itemBuilder: (context, index) {
        if (_sequentialDates[index].date == selectedDateTime) {
          return _selector(_sequentialDates[index]);
        }
        return _calendarDates(_sequentialDates[index]);
      },
    );
  }

  Widget _calendarBodyWeek() {
    if (_sequentialDates == null) return Container();
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisCount: 7,
        crossAxisSpacing: 18,
      ),
      itemBuilder: (context, index) {
        return _weekDayTitle(index);
      },
    );
  }

  // calendar header
  Widget _weekDayTitle(int index) {
    return Text(_weekDays[index],
        style: TextStyle(
          color: const Color(0xff6C584C),
          fontSize: 20,
          fontFamily: 'NanumSquare',
          fontWeight: FontWeight.w600,
        ));
  }

  // calendar element
  Widget _calendarDates(Calendar calendarDate) {
    return InkWell(
        onTap: () {
          if (selectedDateTime != calendarDate.date) {
            if (calendarDate.nextMonth) {
              _getNextMonth();
            } else if (calendarDate.prevMonth) {
              _getPrevMonth();
            }
            setState(() => selectedDateTime = calendarDate.date);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '${calendarDate.date.day}',
                  style: TextStyle(
                    fontSize: 17,
                    color: (calendarDate.thisMonth)
                        ? (calendarDate.date.weekday == DateTime.sunday)
                            ? Colors.redAccent.withOpacity(0.6)
                            : Colors.black87.withOpacity(0.6)
                        : (calendarDate.date.weekday == DateTime.sunday)
                            ? Colors.red.withOpacity(0.3)
                            : Colors.black87.withOpacity(0.3),
                  ),
                ),
                _emotions(calendarDate)
              ],
            ),
          ),
        ),
      );
 
  }

  Widget _emotions(Calendar calendarDate) {
    var _year = calendarDate.date.year;
    var _month = calendarDate.date.month.toString().padLeft(2,'0');
    var _day = calendarDate.date.day.toString().padLeft(2,'0');
    
    for (int i = 0; i < length; i++) {
 
      if ("$_year$_month$_day" == list[i]["date"]) {
        var emotion = list[i]["emotion"];
        return 
           InkWell(
              onTap: () =>
                  Get.toNamed('/diary/date/$_year$_month$_day'),
              child: Image.asset(
                'src/images/emotions/$emotion.png',
                width: 70,
                height: 70,
              ));
      
      } else {
        continue;
      }
    }
    return Container(width: 60, height: 70);
  }

  // date selector
  Widget _selector(Calendar calendarDate) {
    var _year = calendarDate.date.year;
    var _month = calendarDate.date.month;
    var _day = calendarDate.date.day;

    return InkWell(
        onTap: () {
          if (_day == date.day && _year == date.year && _month == date.month) {
            int i=0;
            if(length!=0){
        for (; i < length; i++) {
              if ("$_year${_month.toString().padLeft(2,"0")}${_day.toString().padLeft(2,"0")}" == list[i]["date"]) {
                break;
              }
            }
            }
      
            if (i == length) {
              Get.toNamed('/diary/new');
            }
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '${calendarDate.date.day}',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      backgroundColor: Color(0xff6C584C)),
                ),
              _emotions(calendarDate),
              ],
            ),
          ),
        ),
      );
 
  }

  // get next month calendar
  void _getNextMonth() {
    if (currentDateTime.month == 12) {
      currentDateTime = DateTime(currentDateTime.year + 1, 1);
    } else {
      currentDateTime =
          DateTime(currentDateTime.year, currentDateTime.month + 1);
    }
    _getCalendar();
  }

  // get previous month calendar
  void _getPrevMonth() {
    if (currentDateTime.month == 1) {
      currentDateTime = DateTime(currentDateTime.year - 1, 12);
    } else {
      currentDateTime =
          DateTime(currentDateTime.year, currentDateTime.month - 1);
    }
    _getCalendar();
  }

  // get calendar for current month
  void _getCalendar() {
    _sequentialDates = CustomCalendar().getMonthCalendar(
        currentDateTime.month, currentDateTime.year,
        startWeekDay: StartWeekDay.sunday);
  }

      int _selectedIndex = 1;
    List _selectedMenu = [
    '/diary/monthly/${date.year}${date.month}',
'/diary/monthly/${date.year}${date.month.toString().padLeft(2,"0")}/emotion',
'/diary/monthly/${date.year}${date.month.toString().padLeft(2,"0")}/plant',
  ];

  CurvedNavigationBar buildCurvedNavigationBar(){
  return CurvedNavigationBar(
      index: 1,
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
