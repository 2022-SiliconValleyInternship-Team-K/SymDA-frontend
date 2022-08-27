import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _id = '';
  String _password = '';
  bool idflag = false;
  bool pwflag = false;

  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    void validateAndSave() async {
      final form = _formkey.currentState;

      if (form!.validate()) {
        form.save();
        if (_id == '' || _password == '') {
          print('Form is invalid');
        } else {
          var data = {"email": _id, "password": _password};
          var body = json.encode(data);

 
          http.Response _res = await http.post(
              Uri.parse(
                  'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/users/login'),
              body: body,headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
          if (_res.statusCode == 200||_res.statusCode == 201) {
         Get.toNamed('/diary/monthly/${DateTime.now().year}${DateTime.now().month.toString().padLeft(2,"0")}/emotion');
            print('Form is valid');
          } else {
            print(_res.statusCode);
        
          }
        }
      } else {
        print('Form is invalid');
      }
    }

    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),
        body: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.always,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: (AssetImage('src/images/logo.png')),
                      width: w * 0.7,
                      height: h * 0.3,
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: const Color(0xff6C584C),
                        fontFamily: 'NanumSquare',
                      ),
                      child: Container(
                          padding: EdgeInsets.all(17.0),
                          child: SizedBox(
                            width: w * 0.7,
                            child: Column(children: [
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                onTap: () => idflag = true,
                                onSaved: (value) {
                                  setState(() {
                                    _id = value as String;
                                  });
                                },
                                validator: (value) {
                                  if (idflag) {
                                    if ((value == null || value.isEmpty)) {
                                      return 'Email을 입력해주세요';
                                    } else {
                                      final RegExp regex = RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                      if (!regex.hasMatch(value)) {
                                        return '이메일 형식을 확인해주세요.';
                                      } else {
                                        return null;
                                      }
                                    }
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: const Color(0xff6C584C),
                                style: TextStyle(height: 1.8),
                                decoration: loginDeco("Email"),
                                keyboardType: TextInputType.text,
                              ),
                              Padding(padding: EdgeInsets.only(top: 8)),
                              TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  onTap: () => pwflag = true,
                                  onSaved: (value) {
                                    setState(() {
                                      _password = value as String;
                                    });
                                  },
                                  validator: (value) {
                                    if (pwflag) {
                                      if ((value == null || value.isEmpty)) {
                                        return '비밀번호를 입력해주세요';
                                      } else {
                                      
                                          return null;
                                        
                                      }
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: const Color(0xff6C584C),
                                  style: TextStyle(height: 1.8),
                                  decoration: loginDeco("password"),
                                  obscuringCharacter: '*',
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed('/users/signup');
                                  },
                                  child: Text("이메일로 회원가입",
                                      style: TextStyle(
                                          color: Color(0xff6C584C),
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  validateAndSave();
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(w * 0.43, h * 0.075),
                                  maximumSize: Size(w * 0.43, h * 0.075),
                                  elevation: 5,
                                  primary: Color(0xffADC178),
                                  onPrimary: Colors.white,
                                  textStyle: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: const Text('로그인'),
                              )
                            ]),
                          )),
                    ),
                  ]),
            ),
          ),
        ));
  }

  InputDecoration loginDeco(String t) {
    return InputDecoration(
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
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        labelText: t,
        labelStyle: TextStyle(color: const Color(0xff6C584C)));
  }
}
