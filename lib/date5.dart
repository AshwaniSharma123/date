import 'package:flutter/material.dart';


class six extends StatefulWidget {
  @override
  _sixState createState() => _sixState();
}

class _sixState extends State<six> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        title: Text(
            'Welcome'
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text(
            'Hello!! Ashwani Sharma',
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
