import 'dart:convert';
import 'package:symda/pages/screens/7showOne/components/emotionHeader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class showWeather extends StatefulWidget{
  @override
  State<showWeather> createState() => _showWeatherState();
}

class _showWeatherState extends State<showWeather> {

  String s = list[0]["weather"];
  @override
  Widget build(BuildContext context) {
    if(s=="SUNNY"){
      return Icon(Icons.sunny,color:Colors.redAccent,size: 35);
    }
    else if(s=="CLOUDY"){
      return Icon(Icons.cloud,color: Colors.black54,size: 35);
    
    }
       else if(s=="FOGGY"){
      return Icon(Icons.foggy,color: Colors.grey,size: 35);
  }
  else if(s=="SNOWY"){
    return Icon(Icons.ac_unit,color: Colors.lightBlueAccent,size: 35);

  }
  else{
    return Icon(Icons.umbrella,color: Colors.blueAccent,size: 35);
  }
}
}