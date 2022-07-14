import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:symda_application_1/screens/5Awriting/Screen5A.dart';
import 'package:symda_application_1/screens/5BwriteDone/Screen5B.dart';
import 'package:symda_application_1/screens/6showAll/Screen6.dart';
import 'package:symda_application_1/screens/7showOne/Screen7.dart';
import 'package:symda_application_1/screens/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          Screen5A(),
          Screen5B(),
          Screen6(),
          Screen7(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffA98467),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled_solid),
            label: '작성',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tree),
            label: '내정보',
          ),
        ],
      ),
    );
  }
}
