import 'package:flutter/material.dart';


class third extends StatefulWidget {
  @override
  _thirdState createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        title: Text(
          'Details filled'
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text(
              'Details Saved Successfully',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
