import 'package:flutter/material.dart';

import '../src/calendar.dart';

class mainCalender extends StatefulWidget {
  @override
  State<mainCalender> createState() => _mainCalenderState();
}

enum CalendarViews { dates, months, year }

class _mainCalenderState extends State<mainCalender> {
  late DateTime _currentDateTime;
  late DateTime _selectedDateTime;
  late List<Calendar> _sequentialDates;
  late int midYear;
  CalendarViews _currentView = CalendarViews.dates;
  final List<String> _weekDays = ['일', '월','화', '수', '목', '금', '토'];
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
    _currentDateTime = DateTime(date.year, date.month);
    _selectedDateTime = DateTime(date.year, date.month, date.day);
    setState(() => _getCalendar());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        var w= MediaQuery.of(context).size.width;
       var h= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:const Color(0xffF0EAD2) ,
      body: Center(
          child: SizedBox(
            width: w * 0.9,
            height: h * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "당신의 한달은 \n어땠을까요?",
                      style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 28,
                        color: Color(0xff6C584C),
                      ),
                    )
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
         _datesView()
              ],
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
              child: InkWell(
                onTap: () =>
                    setState(() => _currentView = CalendarViews.months),
                child: Center(
                  child: Text(
                    _monthNames[_currentDateTime.month - 1],
                    style: TextStyle(
                        color: Color(0xffADC178),
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            // next month button
            _toggleBtn(true),
          ],
        ),

        const SizedBox(
          height: 10,
        ),
        Flexible(child: Column(
        
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
                (midYear == null) ? _currentDateTime.year + 9 : midYear + 9;
          } else {
            midYear =
                (midYear == null) ? _currentDateTime.year - 9 : midYear - 9;
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
      childAspectRatio: 5/9,
      mainAxisSpacing: 10,
        crossAxisCount: 7,
        crossAxisSpacing: 18,
      ),
      itemBuilder: (context, index) {
        if (_sequentialDates[index].date == _selectedDateTime)
          return _selector(_sequentialDates[index]);
        return 
        _calendarDates(_sequentialDates[index]
       );
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
        if (_selectedDateTime != calendarDate.date) {
          if (calendarDate.nextMonth) {
            _getNextMonth();
          } else if (calendarDate.prevMonth) {
            _getPrevMonth();
          }
          setState(() => _selectedDateTime = calendarDate.date);
        }
      },
      child: Center(
       
    
            child: 
                SingleChildScrollView(
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
                       //Image.asset('src/images/emotions/joy.png',width: 60,height: 40,)
                    SizedBox(height:20 ,)
                    ],
                  ),
                ),
    
           
          ),
      
    );
  }

  // date selector
  Widget _selector(Calendar calendarDate) {
    return Center(
     
        
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '${calendarDate.date.day}',
                  style:
                      TextStyle(color: Colors.white70,fontSize: 17,backgroundColor:  Color(0xff6C584C)),
                ),SizedBox(height:20 ,)
              ],
            ),
          ),
        
      );
  }

  // get next month calendar
  void _getNextMonth() {
    if (_currentDateTime.month == 12) {
      _currentDateTime = DateTime(_currentDateTime.year + 1, 1);
    } else {
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month + 1);
    }
    _getCalendar();
  }

  // get previous month calendar
  void _getPrevMonth() {
    if (_currentDateTime.month == 1) {
      _currentDateTime = DateTime(_currentDateTime.year - 1, 12);
    } else {
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month - 1);
    }
    _getCalendar();
  }

  // get calendar for current month
  void _getCalendar() {
    _sequentialDates = CustomCalendar().getMonthCalendar(
        _currentDateTime.month, _currentDateTime.year,
        startWeekDay: StartWeekDay.sunday);
  }
}
