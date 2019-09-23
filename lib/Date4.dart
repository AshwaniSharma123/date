import 'package:flutter/material.dart';


class five extends StatefulWidget {
  @override
  _fiveState createState() => _fiveState();
}

class _fiveState extends State<five> {
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
            'Welcome To Flutter World. A Google Product',
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
