import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:symda/pages/loginPage.dart';
//ignore_for_file: prefer_const_constructors

class SplashScreen extends StatefulWidget{

 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin  {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
@override
  void initState() {
  	Timer(Duration(milliseconds: 2500), () {
                   Get.toNamed('/users/login');
                
                });
  }

  @override
  Widget build(BuildContext context) {
final String imageLogoName = 'src/images/logo.png';
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
     return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor:1.0),
        child: Scaffold(
          backgroundColor: const Color(0xffF0EAD2),
          body: Center(
            child: ScaleTransition(
              scale: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Image.asset(
                      imageLogoName,
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.6,
                    ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
}
}