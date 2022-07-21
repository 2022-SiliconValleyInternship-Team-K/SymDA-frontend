import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final myController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String _id = '';
  String _password = '';

     void validateAndSave(){
    final form = _formkey.currentState;
    if(form!.validate())
    {
      form.save();
      print ('Form is valid $_id');
    }
    else
    {
      print('form is invalid');
    }
  }


  @override
  Widget build(BuildContext context) {
              var w= MediaQuery.of(context).size.width;
       var h= MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Form(
          key: _formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: w*0.9,
                height: h*0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
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
                              fontFamily: 'NanumSquare',
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff6C584C))),
                      Image(
                        image: (AssetImage('src/images/logo_2.png')),
                        width: w*0.45,
                        height: h*0.25,
                      ),
                       Theme(
                          data: ThemeData(
                            primaryColor: const Color(0xff6C584C),
                            fontFamily: 'NanumSquare',
                          ),
                          child: Container(
                            width: w*0.68,
                            child: Column(children: [
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                    onSaved: (value) {
                                    setState(() {
                                      _id = value as String;
                                    });
                                  },
                                              validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    } else {
                                      final RegExp regex = RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                      if (!regex.hasMatch(value)) {
                                        return '이메일 형식을 확인해주세요.';
                                      } else {
                                        return null;
                                      }
                                    }
                                  },
                                cursorColor: const Color(0xff6C584C),
                                style: TextStyle(height: 1.5),
                                decoration: signupDeco(
                                    Icon(
                                      Icons.mail_outline,
                                      color: const Color(0xff6C584C),
                                    ),
                                    "Email"),
                                keyboardType: TextInputType.text,
                              ),
                             
                              Padding(padding: EdgeInsets.only(top: 8)),
                                           TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                    onSaved: (value) {
                                    setState(() {
                                      _password = value as String;
                                    });
                                  },
                                              validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    } else {
                                      final RegExp regex = RegExp(
                                          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{7,}$');
                                      if (!regex.hasMatch(value)) {
                                        return '특수문자, 영어, 숫자 포함 7자 이상 입력해주세요';
                                      } else {
                                        return null;
                                      }
                                    }
                                  },
                                cursorColor: const Color(0xff6C584C),
                                style: TextStyle(height: 1.5),
                                decoration: signupDeco(
                                    Icon(
                                    Icons.password,
                                    color: const Color(0xff6C584C),
                                  ),
                                    "Password"),
                                keyboardType: TextInputType.text,
                                   obscuringCharacter: '*',
      obscureText: true,
      controller: myController,
                              ),
                              Padding(padding: EdgeInsets.only(top: 8)),
                               TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                              validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    } else {
                                if(value!=myController.text){
                                  return '비밀번호가 일치하지 않습니다';

                                }
                               else {
                                        return null;
                                      }
                                    }
                                  },
                                cursorColor: const Color(0xff6C584C),
                                style: TextStyle(height: 1.5),
                                decoration: signupDeco(
                                    Icon(
                                    Icons.password,
                                    color: const Color(0xff6C584C),
                                  ),
                                    "Confirm Password"),
                                keyboardType: TextInputType.text,
                                   obscuringCharacter: '*',
      obscureText: true,
                              ),
                        
        
                              Padding(padding: EdgeInsets.only(top: 20)),
                              ElevatedButton(
                                onPressed: () async {
                          validateAndSave();
                                },
                                child: Text('회원가입'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(w*0.4, h*0.07),
                                  maximumSize: Size(w*0.4, h*0.07),
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
                      
                    ]),
              ),
            ),
          ),
        ));
  }


  InputDecoration signupDeco(Icon i, String text) {
    return InputDecoration(
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
        labelStyle: TextStyle(color: const Color(0xff6C584C)));
  }
}
