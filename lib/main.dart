import 'package:flutter/material.dart';
import 'package:popup_bubble_app/home.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        }
    );
  }
}