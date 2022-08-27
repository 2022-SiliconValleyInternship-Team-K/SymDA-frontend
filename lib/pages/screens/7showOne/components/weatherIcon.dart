import 'dart:convert';
import 'package:symda/pages/screens/7showOne/components/emotionHeader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import'package:symda/pages/mainCalender.dart';
var list;
class showWeather extends StatefulWidget{
  @override
  State<showWeather> createState() => _showWeatherState();
}
   Future<String> fetchInfo() async {
    var url =
       'http://ec2-3-37-88-234.ap-northeast-2.compute.amazonaws.com:8080/diary/date/${mainCalenderState.selectedDateTime.year}${mainCalenderState.selectedDateTime.month.toString().padLeft(2,"0")}${mainCalenderState.selectedDateTime.day.toString().padLeft(2,"0")}';
    final response = await http.get(Uri.parse(url));
   
      var responseBody = json.decode(response.body);
  
    
    if (response.statusCode == 200||response.statusCode == 201) {
      print("서버 응답");
      return responseBody["weather"];
    } else {
      throw Exception("정보 불러오기 실패");
    }
  }

class _showWeatherState extends State<showWeather> {


  @override
  Widget build(BuildContext context) {
  return Container(
    child: FutureBuilder(future: fetchInfo(),
    builder:(BuildContext context, AsyncSnapshot snapshot){
       if(snapshot.hasData==false){
                      return CircularProgressIndicator();
                    }else if(snapshot.hasError){
                            return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),);
                    }else{
                          if(snapshot.data.toString()=="SUNNY"){
        return Icon(Icons.sunny,color:Colors.redAccent,size: 35);
      }
      else if(snapshot.data.toString()=="CLOUDY"){
        return Icon(Icons.cloud,color: Colors.black54,size: 35);
      
      }
         else if(snapshot.data.toString()=="FOGGY"){
        return Icon(Icons.foggy,color: Colors.grey,size: 35);
    }
    else if(snapshot.data.toString()=="SNOWY"){
      return Icon(Icons.ac_unit,color: Colors.lightBlueAccent,size: 35);
  
    }
    else{
      return Icon(Icons.umbrella,color: Colors.blueAccent,size: 35);
    }
                      
                    }
    }
    ),
  );
}
}


