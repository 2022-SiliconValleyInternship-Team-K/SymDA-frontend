import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen5A extends StatelessWidget {
  const Screen5A({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SymDa'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(children: [
            _HowDay('오늘 하루\n어떠셨나요?'),
            SizedBox(
              height: 30,
            ),
            _dailyQ(),
            SizedBox(
              height: 30,
            ),
            _weatherQ('오늘의 날씨는?'),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _weather('맑음', FontAwesomeIcons.sun),
                _weather('구름', FontAwesomeIcons.cloudSun),
                _weather('흐림', FontAwesomeIcons.cloud),
                _weather('비', FontAwesomeIcons.cloudRain),
                _weather('눈', FontAwesomeIcons.snowflake),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '오늘 하루는?', fillColor: Colors.white, filled: true),
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _IMGfromGal(),
                _IMGfromCam(),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget _HowDay(String title) {
  return Container(
    color: Colors.yellow,
    height: 20,
  );
}

Widget _dailyQ() {
  return Container(
    color: Colors.red,
    height: 50,
  );
}

Widget _weatherQ(String title) {
  return Container(
    color: Colors.green,
    height: 20,
  );
}

Widget _weather(String title, IconData iconData) {
  return Container(
    color: Colors.blue,
    height: 50,
    width: 50,
  );
}

Widget _IMGfromGal() {
  return Container(
    color: Colors.pink,
    height: 80,
    width: 80,
  );
}

Widget _IMGfromCam() {
  return Container(
    color: Colors.pink,
    height: 80,
    width: 80,
  );
}
