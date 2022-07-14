import 'package:flutter/material.dart';

class Screen5B extends StatelessWidget {
  const Screen5B({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen5B'),
      ),
      body: Center(
        child: Text(
          'Screen5B',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
