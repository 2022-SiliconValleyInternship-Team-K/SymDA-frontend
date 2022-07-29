import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeatherState();
  }
}

class WeatherState extends State<Weather> {
  // const Weather({Key? key}) : super(key: key);

  static late String w;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 0.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '오늘 날씨는 어땠나요?',
                  style: textTheme().headline3,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.sunny),
                        color:
                            w == "SUNNY" ? Color(0xffADC178) : Colors.redAccent,
                        focusColor: Color(0xffADC178),
                        onPressed: () {
                          w = "SUNNY";
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.foggy),
                        color: w == "FOGGY" ? Color(0xffADC178) : Colors.grey,
                        onPressed: () {
                          w = "FOGGY";
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.cloud),
                        color:
                            w == "CLOUDY" ? Color(0xffADC178) : Colors.black54,
                        onPressed: () {
                          w = "CLOUDY";
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.umbrella),
                        color: w == "RAINY"
                            ? Color(0xffADC178)
                            : Colors.blueAccent,
                        onPressed: () {
                          w = "RAINY";
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.ac_unit),
                        color: w == "SNOWY"
                            ? Color(0xffADC178)
                            : Colors.lightBlueAccent,
                        onPressed: () {
                          w = "SNOWY";
                        },
                      ),
                    ]),
              ],
            )),
      ),
    );
  }
}
