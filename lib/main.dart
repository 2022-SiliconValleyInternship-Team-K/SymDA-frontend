import 'package:flutter/material.dart';
import 'package:symda_application_1/screens/5BwriteDone/Screen5B.dart';
import 'package:symda_application_1/screens/6showAll/Screen6.dart';
import 'package:symda_application_1/screens/7showOne/Screen7.dart';
import 'package:symda_application_1/screens/main_screen.dart';
import 'package:symda_application_1/theme.dart';
// import 'screens/5Awriting/Screen5A.dart';
// import 'screens/5BwriteDone/Screen5B.dart';
// import 'package:symda_application_1/screens/6showAll/Screen6.dart';
// import 'package:symda_application_1/screens/7showOne/Screen7.dart';

// import 'package:intl/date_symbol_data_local.dart';
import 'package:symda_application_1/screens/loginPage.dart';
import 'package:symda_application_1/screens/signUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SYMDA',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        theme: theme(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => Screen5A(),
        //   '/d': (context) => Screen7(),
        // },

        routes: <String, WidgetBuilder>{
          '/HomeScreen': ((BuildContext context) => LogIn()),
          '/SignUp': ((BuildContext context) => SignUp()),
          '/b': (context) => Screen5B(),
          '/c': (context) => Screen7(),
          '/d': (context) => Screen6(),
        });
  }
}
