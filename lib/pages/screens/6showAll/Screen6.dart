import 'package:flutter/material.dart';
import 'components/showAllBody.dart';

class Screen6 extends StatelessWidget {
  const Screen6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: ShowAllBody(
                  // showAll: showAllList[0], // 일기가 여러 개이면 여러 개 보여줌
                  ),
            )
          ],
        ));
  }
}
