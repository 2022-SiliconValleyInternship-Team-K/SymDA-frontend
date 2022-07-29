import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symda/pages/emotionResult.dart';
import 'package:symda/pages/screens/5Awriting/components/headerText.dart';
import 'package:symda/pages/screens/5Awriting/components/weather.dart';
import 'package:symda/src/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:symda/pages/screens/5Awriting/components/writingField.dart';
class DoneButton extends StatefulWidget {
  final String? text;
  final GestureTapCallback? press;


  const DoneButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  State<DoneButton> createState() => _DoneButtonState();
}

class _DoneButtonState extends State<DoneButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () async {
                    var data = {
                      "content":WritingFieldState.inputText,
                      "weather":WeatherState.w,
                      "questionId":HeaderText.qeustionI,
                    };
          var body = json.encode(data);
                   http.Response _res = await http.post(
              Uri.parse(
                  'http://ec2-13-209-3-136.ap-northeast-2.compute.amazonaws.com:8080/diary/content'),
              body: body);
          if (_res.statusCode == 200) {
         Get.to(() => EmotionResult());
            print('Form is valid');
          } else {
            print(_res.statusCode);
        
          }

     print(body);
          
        },
        child: Center(
          child: Text(
            "다 적었어요!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "NanumSquare",
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: theme().primaryColor,
          // padding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
