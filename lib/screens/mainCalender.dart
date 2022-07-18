import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0EAD2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "당신의 한달은 \n 어땠을까요?",
                  style: TextStyle(
                      fontSize: 30,
                      color: const Color(0xff6C584C),
                      fontFamily: 'NanumMyeongjo'),
                ),
              ),
              TableCalendar(
                focusedDay: selectedDay,

                firstDay: DateTime(2000),

                lastDay: DateTime(2050),

                daysOfWeekHeight: 30,

                calendarFormat: format,

                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },

                startingDayOfWeek: StartingDayOfWeek.sunday,

                daysOfWeekVisible: true,

                locale: 'ko-KR',

                //Day changed

                onDaySelected: (DateTime selectDay, DateTime focusday) {
                  setState(() {
                    selectedDay = selectDay;

                    focusedDay = focusday;
                  });
                },

                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },

                //To style the Calendar

                calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    weekendTextStyle: TextStyle(color: Colors.grey),
                    outsideDaysVisible: false,
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: const Color(0xff6C584C),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xff6C584C), width: 2.0)),
                    todayTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),

                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                      fontSize: 35,
                      color: const Color(0xffADC178),
                      fontWeight: FontWeight.bold),
                  formatButtonVisible: false,
                  titleCentered: true,
                  rightChevronVisible: false,
                  leftChevronVisible: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
