import 'package:flutter/material.dart';
import 'package:symda_application_1/theme.dart';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WeatherState();
  }
}

class WeatherState extends State<Weather> {
  // const Weather({Key? key}) : super(key: key);

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오늘의 날씨는?',
                  style: textTheme().bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.sunny),
                        color: Colors.redAccent,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.air),
                        color: Colors.lightBlue,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.cloud),
                        color: Colors.lightBlueAccent,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.umbrella),
                        color: Colors.blueAccent,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.ac_unit),
                        color: Colors.lightBlueAccent,
                        onPressed: () {},
                      ),
                    ]),
              ],
            )),
      ),
    );
  }
}
