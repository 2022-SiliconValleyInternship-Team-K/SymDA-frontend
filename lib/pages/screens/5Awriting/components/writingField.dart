import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:symda/src/theme.dart';

class WritingField extends StatefulWidget {
  const WritingField({Key? key}) : super(key: key);

  @override
  State<WritingField> createState() => WritingFieldState();
}

class WritingFieldState extends State<WritingField> {
  static String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                    TextField(
                    cursorColor:Color(0xffA98467),
                      style:TextStyle(fontFamily: "YS"),
                      onChanged: (text) {
                        setState(() {
                          inputText = text;
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(15.0),borderSide:BorderSide(color:Color(0xffA98467))),
                       labelText:'${DateTime.now().year}년 ${DateTime.now().month.toString().padLeft(2,"0")}월 ${DateTime.now().day.toString().padLeft(2,"0")}일',
                        
                        labelStyle: textTheme().bodyText1,
                      ),
         keyboardType: TextInputType.multiline,
                     minLines: 2,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
