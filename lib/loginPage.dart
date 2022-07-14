import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'signUp.dart';

// ignore_for_file: prefer_const_constructors

class LogIn extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

onSubmit() {
  print("s");
}



class _LogInState extends State<LogIn> {
 

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),
        body: Center(
          child: SingleChildScrollView(
              child: 
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 Image(
                  image: (AssetImage('src/images/logo.png')),
                  width: 220.0,
                  height: 200.0,
                ),      
                        Form(
                child: Theme(
                  data: ThemeData(
                    primaryColor: const Color(0xff6C584C),
                    fontFamily: 'NanumSquare',
                  ),
                  child: Container(
                      padding: EdgeInsets.all(17.0),
                      child: Container(
                        width: 270,
                        child: Column(children: [
                          loginField("Email", false),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          loginField("password", true),
                         
                          Container(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                            
                              onPressed: () { Navigator.pushNamed(context, '/SignUp'); },
                              child:Text("이메일로 회원가입", style:TextStyle(color:Color(0xff6C584C),decoration: TextDecoration.underline)),
                            ),
                          ),
                         
                          ElevatedButton(
                            onPressed: onSubmit,
                            child: Text('로그인'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(160, 60),
                              maximumSize: Size(160, 60),
                              elevation: 5,
                              primary: Color(0xffADC178),
                              onPrimary: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          )
                        ]),
                      )),
                ),
                        )
                      ]),
              ),
        ));
  }
  
    TextField loginField(String text, bool b) {
    return TextField(
    
      cursorColor:const Color(0xff6C584C),
      style: TextStyle(height: 1.8),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(15.0),
      borderSide:BorderSide(color: const Color(0xff6C584C), 
    ),
    ),
    focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(15.0),
      borderSide:BorderSide(color: const Color(0xff6C584C), width: 2.0
    ),
    ),
          filled: true,
          fillColor: Colors.white70,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          labelText: text,
          labelStyle: TextStyle(
              color:const Color(0xff6C584C)
                 )),
                  
      keyboardType: TextInputType.text,
      obscureText: b,
    );
  }

}


