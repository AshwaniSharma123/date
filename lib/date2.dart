import 'package:date/Date4.dart';
import 'package:date/date5.dart';
import 'package:flutter/material.dart';
import 'Date.dart';
import 'package:date/navigateBottom.dart';


class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String name,password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:  AppBar(
          centerTitle: true,
          title: Text(
            'Flutter UI',
                style: TextStyle(
              fontSize: 30.0,
                  color: Colors.black54,
          ),
          ),
        ),


        drawer: Drawer(
          child:  ListView(
            children: <Widget>[
               UserAccountsDrawerHeader(
                 accountName: Text('Ashwani Sharma'),
                accountEmail:  Text("ashwanisharma809@gmail.com"),
                currentAccountPicture :
                CircleAvatar(
                  backgroundColor:Colors.white,
                  child:  Text("User"),
                ),
              ),
               ListTile(
                  title:  Text("My Profile"),
                  trailing:  Icon(Icons.person),
                  onTap: (){Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (BuildContext context)=>six()));}
              ),
               Divider(),
               ListTile(
                  title:  Text("My Orders"),
                  trailing:  Icon(Icons.shopping_cart),
                  onTap: (){
                    Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (BuildContext context)=>fourth()));
                  }
              ),
               Divider(),
               ListTile(
                title:  Text("Setting"),
                trailing:  Icon(Icons.settings_applications),
              ),
               Divider(),
               ListTile(
                title:  Text("24*7 Support"),
                trailing:  Icon(Icons.phone),
              ),
               Divider(),
            ],
          ),
        ),

        body:  SingleChildScrollView(
          child:  Container(
         //   height: MediaQuery.of(context).size.height,
            // height: 800,
            margin:  EdgeInsets.all(15.0),
            child:
            Form(
              key: _key,
              autovalidate: _validate,
              child: formUI(),
            ),

          ),
        ),
      ),
    );
  }
  formUI()
  {
    return
        Container(
        child: Column(
          children: <Widget>[
            Text("Welcome To Flutter", style: TextStyle(
              fontSize: 40.0,
              color: Colors.pinkAccent,
            ),
            ),
            SizedBox(height: 50.0),

            TextFormField(
              decoration:  InputDecoration(hintText: 'Username',prefixIcon:Icon(Icons.person,size: 40.0,color: Colors.redAccent,)),
              keyboardType: TextInputType.text,
              //  maxLength: 8,
              validator: validateName,
              onSaved: (String val) {
                name = val;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
                decoration:  InputDecoration(hintText: 'Password',prefixIcon: Icon(Icons.lock,size: 40.0,color: Colors.black,)),
                keyboardType: TextInputType.text,
                // maxLength: 8,
                validator: validatePassword,
                onSaved: (String val) {
                  password = val;
                }
            ),
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    color: Colors.purpleAccent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text('Register',
                      style:
                      TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => fourth()),
                      );
                    }
                ),
                // SizedBox(width: 150.0,),
                RaisedButton(
                  onPressed: _sendToServer,
                  color: Colors.pink,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all
                        (Radius.circular(10.0))
                  ),
                  child: Text('Sign In',style: TextStyle(
                      fontSize: 20.0
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  }
  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp =  RegExp(patttern);
    if (value.length == 0) {
      return "Username is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Username must be a-z and A-Z";
    }
    return null;
  }
  String validatePassword(String value) {
    String pattern = r'(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$';
    RegExp regExp =  RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Password";
    }else
      {
      return null;
      }
  }
  _sendToServer()
  {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print("Username $name");
      print("Password $password");
      Navigator.push(context,MaterialPageRoute(builder: (context) => five(),
      ),
      );
    } else {
      setState(()
      {
        _validate = true;
      }
      );
    }
  }
}