import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';


class DoneButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? press;
  // final Color color;

  const DoneButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/b');
        },
        child: Center(
          child: Text(
            "다 적었어요!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "NanumSquare",
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: theme().primaryColor,
          // padding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
