import 'package:flutter/material.dart';
import 'components/showAllBody.dart';
import 'package:symda/src/theme.dart';

class Screen6 extends StatelessWidget {
  const Screen6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffF0EAD2),

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: h*0.05,),
                SizedBox(
                width: w*0.9,
                    child: ShowAllBody(
          
                        ),
                  ),]
            ),
          ),
        )
      
        );
  }
}
