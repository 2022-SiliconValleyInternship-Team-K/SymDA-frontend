import 'package:flutter/material.dart';
import 'package:symda/pages/emotionResult.dart';
import 'package:symda/pages/emotionSelect.dart';
import 'package:symda/pages/loginPage.dart';
import 'package:symda/pages/mainCalender.dart';
import 'package:symda/pages/plant.dart';
import 'package:symda/pages/screens/5BwriteDone/Screen5B.dart';
import 'package:symda/pages/screens/6showAll/Screen6.dart';
import 'package:symda/pages/screens/7showOne/Screen7.dart';
import 'package:symda/pages/signUp.dart';
import 'package:symda/pages/splashScreen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;
import 'package:symda/src/theme.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SYMDA",
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': ((BuildContext context) => LogIn()),
        '/signup': ((BuildContext context) => SignUp()),
        '/EmotionSelect': ((BuildContext context) => EmotionSelect()),
        '/plant': ((BuildContext context) => plant()),
        '/emotion': ((BuildContext context) => mainCalender()),
        '/writingdone': ((BuildContext context) => Screen5B()),
        '/showone': ((BuildContext context) => Screen7()),
        '/showall': ((BuildContext context) => Screen6()),
      },
    );
  }
}
