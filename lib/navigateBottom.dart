
import 'package:date/date5.dart';
import 'package:flutter/material.dart';
import 'package:date/date3.dart';
import 'package:date/date2.dart';

class seventh extends StatefulWidget {
  @override
  _seventhState createState() => _seventhState();
}

class _seventhState extends State<seventh> {

  int _selectedIndex = 0;

  static double IconSize = 200;
  static List<Widget> _widgetOptions = <Widget>[
     Second(),
     six(),
     third(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        //backgroundColor: Colors.deepPurpleAccent,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.lock,color: Colors.black,),
              title: Text('Sign In'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info,color: Colors.pink,),
              title: Text('Details'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit,color: Colors.green,),
              title: Text('Edit'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}