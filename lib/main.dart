import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symda/pages/loginPage.dart';
import 'package:symda/pages/mainCalender.dart';
import 'package:symda/pages/plant.dart';
import 'package:symda/pages/screens/5Awriting/Screen5A.dart';
import 'package:symda/pages/signUp.dart';
import 'package:symda/pages/splashScreen.dart';
import 'package:intl/date_symbol_data_local.dart';


void main(){
  initializeDateFormatting().then((_)=>runApp(MyApp()));

}

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:"SYMDA",
      initialRoute: '/',
      getPages:[
        GetPage(name: '/', page: ()=> SplashScreen()),
        GetPage(name: '/users/login', page: ()=> LogIn()),
        GetPage(name: '/users/signup', page: ()=> SignUp()),
        GetPage(name: '/diary/monthly/:date/plant', page: ()=> plant()),
        GetPage(name: '/diary/monthly/:date/emotion', page: ()=> mainCalender()),
        GetPage(name: '/diary/monthly/:date', page: ()=> mainCalender()),
        GetPage(name: '/diary/new', page: ()=> Screen5A()),
        GetPage(name: '/diary/date/:date', page: ()=> Screen5A()),
      ]
     
   
       
  
    );
  }
}

