import 'package:flutter/material.dart';

// import 'screens/5Awriting/Screen5A.dart';
import 'screens/5BwriteDone/Screen5B.dart';
import 'screens/6showAll/Screen6.dart';
import 'screens/7showOne/Screen7.dart';
import 'screens/main_screen.dart';
import 'theme.dart';

import 'screens/home.dart';
import 'screens/loginPage.dart';
import 'screens/mainCalender.dart';
import 'screens/signUp.dart';
import 'screens/splashScreen.dart';

// import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SYMDA',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        theme: theme(),
        routes: <String, WidgetBuilder>{
          '/HomeScreen': ((BuildContext context) => LogIn()),
          '/SignUp': ((BuildContext context) => SignUp()),
          '/b': (context) => Screen5B(),
          '/c': (context) => Screen7(),
          '/d': (context) => Screen6(),
        });
  }
}
