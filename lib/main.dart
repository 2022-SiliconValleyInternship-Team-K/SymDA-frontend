import 'package:flutter/material.dart';
import 'package:symda/loginPage.dart';
import 'package:symda/mainCalender.dart';
import 'package:symda/signUp.dart';
import 'package:symda/splashScreen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main(){
  initializeDateFormatting().then((_)=>runApp(MyApp()));
}

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"SYMDA",
      home:SplashScreen(),
      routes: <String,WidgetBuilder>{
        '/HomeScreen':((BuildContext context) => LogIn()),
        '/SignUp':((BuildContext context) => SignUp()),
       
      },


    );
  }

}