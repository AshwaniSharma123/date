
import 'package:date/Date.dart';
import 'package:date/date2.dart';
import 'package:flutter/material.dart';
import 'package:date/date2.dart';
import 'package:date/navigateBottom.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: seventh(),
    );
  }
}
