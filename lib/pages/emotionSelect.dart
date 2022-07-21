import 'package:flutter/material.dart';


class EmotionSelect extends StatefulWidget {
  const EmotionSelect({Key? key}) : super(key: key);

  @override
  State<EmotionSelect> createState() => _EmotionSelectState();
}

class _EmotionSelectState extends State<EmotionSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                '심다가 실수를 했군요 :( \n당신의 오늘 하루는 어땠나요?',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'NanumMyeongjo',
                    color: Color(0xff6C584C),
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmotionsIcon('joy'),
                  EmotionsIcon(
                    'anger',
                  ),
                  EmotionsIcon('fear'),
                  EmotionsIcon(
                    'sad',
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  Center EmotionsIcon(String s) {
    String etext;
    if (s == 'joy') {
      etext = '행복';
    } else if (s == 'sad') {
      etext = '슬픔';
    } else if (s == 'anger') {
      etext = '화남';
    } else {
      etext = '불안';
    }
    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: () async {
             await showDialog(context: context, builder: (BuildContext context){
                  return  AlertDialog(content:Text("'$etext'을 선택하신게 맞나요?",
                  style:TextStyle(fontFamily: 'NanumSquare',color: Color(0xff6C584C),fontSize: 18)
                   ), 
                   
                   backgroundColor: const Color(0xffF0EAD2),
                actions: [Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 50),primary:const Color(0xffADC178),), 
                        onPressed: () { 
                          
                           },
                      child:Text('네',style:TextStyle(fontFamily: 'NanumSquare',fontWeight: FontWeight.bold)) ),
                      Padding(padding: EdgeInsets.only(left: 15)),
                      ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 50),primary:const Color(0xffADC178)),
                        onPressed: () { 
                          Navigator.of(context).pop();
                           },
                           
                      child:Text('아니오',style:TextStyle(fontFamily: 'NanumSquare',fontWeight: FontWeight.bold)) ),
                    ],
                  ),
                )],); 
                });
              },
              icon: Image.asset('src/images/emotions/$s.png'),
              iconSize: 82),
          Text(etext,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'NanumSquare',
                color: Color(0xffA98467),
              ))
        ],
      ),
    );
  }
}
