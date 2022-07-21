import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';


class WritingField extends StatefulWidget {
  const WritingField({Key? key}) : super(key: key);

  @override
  State<WritingField> createState() => _WritingFieldState();
}

class _WritingFieldState extends State<WritingField> {
  String inputText = 'happy';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Text('$inputText'),

                    TextField(
                      onChanged: (text) {
                        setState(() {
                          inputText = text;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: '오늘 하루는 어땠나요?',
                        labelStyle: textTheme().bodyText1,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffA98467), width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
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
