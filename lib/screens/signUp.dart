import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 360,
              height: 600,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                color: const Color(0xffF0EAD2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'YS',
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff6C584C))),
                    Image(
                      image: (AssetImage('src/images/logo_2.png')),
                      width: 160.0,
                      height: 180.0,
                    ),
                    Form(
                      child: Theme(
                        data: ThemeData(
                          primaryColor: const Color(0xff6C584C),
                          fontFamily: 'NanumSquare',
                        ),
                        child: Container(
                          width: 270,
                          child: Column(children: [
                            signupField(
                                "Email",
                                false,
                                Icon(
                                  Icons.mail_outline,
                                  color: const Color(0xff6C584C),
                                )),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            signupField(
                                "Password",
                                true,
                                Icon(
                                  Icons.password,
                                  color: const Color(0xff6C584C),
                                )),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            signupField(
                                "Confirm Password",
                                true,
                                Icon(
                                  Icons.password,
                                  color: const Color(0xff6C584C),
                                )),
                            Padding(padding: EdgeInsets.only(top: 20)),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('회원가입'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(160, 45),
                                maximumSize: Size(160, 45),
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
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }

  TextField signupField(String text, bool b, Icon i) {
    return TextField(
      cursorColor: const Color(0xff6C584C),
      style: TextStyle(height: 1.5),
      decoration: InputDecoration(
          prefixIcon: i,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: const Color(0xff6C584C),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: const Color(0xff6C584C), width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white70,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          labelText: text,
          labelStyle: TextStyle(color: const Color(0xff6C584C))),
      keyboardType: TextInputType.text,
      obscureText: b,
    );
  }
}
