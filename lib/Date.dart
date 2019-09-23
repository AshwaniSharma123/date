import 'package:date/date3.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class fourth extends StatefulWidget {

  fourth({Key key, this.title}) : super(key: key);

   String title;

  @override

  _fourthState createState() => _fourthState();
}
class _fourthState extends State<fourth> {
  GlobalKey<FormState> _key = new GlobalKey();
  String _name;
  String _namel;
  String email;
  String home;
  String mobile;
  final textEditingController = TextEditingController();
  final birthCtrl = TextEditingController();
  bool _male = false;
  bool _female = false;
  bool _validate =false;
//  bool _password =false;
  DateTime selectedDate = DateTime.now();

  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birthCtrl.text = picked.toString();
      }
      );
  }

  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            // manage the state of each value
            setState(() {
              switch (title) {
                case "Male":
                  _male = value;
                  _female = !value;
                  break;
                case "Female":
                  _male = !value;
                  _female = value;
                  break;
              }
            }
            );
          },
        ),
      ],
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
            'Registeration Form'
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _key,
            autovalidate: _validate,
            child: FormUI(),
          ),
        ),
      ),
    );
  }

 Widget FormUI() {
    return Column(
      children: <Widget>
      [
        SizedBox(height: 10.0),
        Text("Registration Form", style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown,
        ),
        ),
        Divider(height: 50.0, color: Colors.blue),
        TextFormField(
          validator: validatename,
          onSaved: (String val) {
            _name = val;
          },
          decoration: InputDecoration(hintText: 'First Name',
              prefixIcon: Icon(
                  Icons.contacts, size: 35, color: Colors.redAccent)),
          keyboardType: TextInputType.text,
        ),

        TextFormField(
          validator: validatename,
          onSaved: (String val) {
            _namel = val;
          },
          decoration: InputDecoration(hintText: 'Last Name',
              prefixIcon: Icon(
                Icons.contacts, size: 35, color: Colors.blueGrey,)),
          keyboardType: TextInputType.text,
        ),

        TextField(
          controller: birthCtrl,
          decoration: InputDecoration(hintText: 'Birth Day',
            prefixIcon: Icon(
              Icons.cake, size: 35, color: Colors.greenAccent,),),
          keyboardType: TextInputType.datetime,
          onTap: () => _selectDate(context),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.person, size: 35, color: Colors.indigo,),
              Text("Gender   ->",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              Text("                       "),
              checkbox("Male", _male),
              checkbox("Female", _female),
            ],
          ),
        ),
        Divider(color: Colors.black87,),
         TextFormField(
          validator: validateemail,
          onSaved: (String val) {
            email = val;
          },
          decoration: InputDecoration(hintText: 'Email',
              prefixIcon: Icon(Icons.email, size: 35, color: Colors.red,)),
          keyboardType: TextInputType.emailAddress,
        ),
        TextFormField(
          validator: validatehome,
          onSaved: (String val) {
            home = val;
          },
          decoration: InputDecoration(hintText: 'HomeTown',
              prefixIcon: Icon(Icons.home, size: 35, color: Colors.blueGrey,)),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          validator: validatemobile,
          onSaved: (String val) {
            mobile = val;
          },
          decoration: InputDecoration(hintText: 'Phone Number',
              prefixIcon: Icon(Icons.call, size: 35, color: Colors.green,)),
          keyboardType: TextInputType.number,
          maxLength: 10,
        ),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            RaisedButton(
              splashColor: Colors.indigoAccent,
              onPressed: _sendToServer,
              color: Colors.redAccent,
              child: Text(
                '  Save Credentials ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
       );
  }
  String validatename(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp =  RegExp(patttern);
    if (value.length == 0) {
      return "Username is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Username must be a-z and A-Z";
    }
    return null;
  }
  String validatenamel(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp =  RegExp(patttern);
    if (value.length == 0) {
      return "Username is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Username must be a-z and A-Z";
    }
    return null;
  }
  String validateemail(String value) {
    String patttern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp =  RegExp(patttern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Email must contain @ and domain";
    }
    return null;
  }
  String validatehome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp =  RegExp(patttern);
    if (value.length == 0) {
      return "Home Town is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Home Town must be a-z and A-Z";
    }
    return null;
  }
  String validatemobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp =  RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  _sendToServer()
  {
    if (_key.currentState.validate())
    {
      _key.currentState.save();
      print("first name $_name");
      print("last name $_namel");
      print("Email $email");
      print("Home Town $home");
      print("mobile $mobile");
      Navigator.push(context,MaterialPageRoute(builder: (context) => third(),
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
