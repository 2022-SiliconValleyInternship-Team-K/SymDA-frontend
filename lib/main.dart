import 'package:flutter/material.dart';
import 'package:symda_application_1/screens/main_screen.dart';
import 'package:symda_application_1/theme.dart';
// import 'screens/5Awriting/Screen5A.dart';
// import 'screens/5BwriteDone/Screen5B.dart';
// import 'package:symda_application_1/screens/6showAll/Screen6.dart';
// import 'package:symda_application_1/screens/7showOne/Screen7.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SymDa',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: theme(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Screen5A(),
      //   '/b': (context) => Screen5C(),
      //   '/c': (context) => Screen6(),
      //   '/d': (context) => Screen7(),
      // },
    );
  }
}
