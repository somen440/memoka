import 'package:flutter/material.dart';

class MyRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hello Rectangle',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello Rectangle'),
          ),
          body: Center(
            child: Container(
              color: Colors.greenAccent,
              height: 400.0,
              width: 300.0,
              child: Center(
                child: Text(
                  'hello',
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ));
  }
}
