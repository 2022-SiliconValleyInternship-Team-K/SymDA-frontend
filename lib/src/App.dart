import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:symda/pages/screens/5Awriting/Screen5A.dart';
import 'package:symda/pages/screens/6showAll/Screen6.dart';

import '../pages/mainCalender.dart';
import '../pages/plant.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 1;

  List _selectedMenu = [Screen5A(), mainCalender(), plant()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildCurvedNavigationBar(),
      body: Container(
        child: _selectedMenu.elementAt(_selectedIndex),
      ),
    );
  }

  CurvedNavigationBar buildCurvedNavigationBar() {
    return CurvedNavigationBar(
        index: 1,
        height: 45,
        backgroundColor:
            (_selectedIndex == 0) ? Colors.white70 : const Color(0xffF0EAD2),
        buttonBackgroundColor: Colors.transparent,
        color: const Color(0xff6C584C).withOpacity(0.8),
        animationDuration: const Duration(milliseconds: 150),
        animationCurve: Curves.easeInOutQuart,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          Icon(CupertinoIcons.add_circled_solid,
              size: (_selectedIndex == 0) ? 30 : 20,
              color: (_selectedIndex == 0)
                  ? Color(0xffADC178)
                  : Color(0xffF0EAD2)),
          Icon(CupertinoIcons.calendar,
              size: (_selectedIndex == 1) ? 30 : 20,
              color: (_selectedIndex == 1)
                  ? Color(0xffADC178)
                  : Color(0xffF0EAD2)),
          Icon(CupertinoIcons.tree,
              size: (_selectedIndex == 2) ? 30 : 20,
              color:
                  (_selectedIndex == 2) ? Color(0xffADC178) : Color(0xffF0EAD2))
        ]);
  }
}
