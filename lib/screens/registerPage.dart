import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peach/colors.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
    @override
    _RegisterPageState createState() => _RegisterPageState();
  }
  
  class _RegisterPageState extends State<RegisterPage> {

    String username, password, email;
    final _key = new GlobalKey<FormState>();

    checkForm() {
    final form = _key.currentState;
    if(form.validate()) {
      form.save();
      register();
    }
  }

  register() async {
    final response = await http.post('https://apiforpeach.000webhostapp.com/API/register.php', body: {
      "username": username,
      "password": password,
      "email": email
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String msg = data['message'];
    if(value==1) {
      setState(() {
        Navigator.pop(context);
      });
      print(msg);
    } else {
      print(msg);
    }
    print(data);
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Form(
            key: _key,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorPeach,
                    Colors.pinkAccent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: ListView(
                children: <Widget>[
                  headerSection(),
                  textSection(),
                  buttonSection(),
                ],
              ),
            )
          )
      );
    }

    Container headerSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Text('Peach', style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,),
      );
    }

    Container textSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            inputUsername('Username', Icons.person),
            SizedBox(height: 30,),
            inputPassword('Password', Icons.lock),
            SizedBox(height: 30,),
            inputEmail('Email', Icons.email)
          ],
        ),
      );
    }

    TextFormField inputUsername(String title, IconData icon) {
      return TextFormField(
        validator: (field) {
          if(field.isEmpty) {
            return "Please insert a username";
          }
        },
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(icon),
        ),
        onSaved: (field)=> username = field,
      );
    }

    TextFormField inputPassword(String title, IconData icon) {
      return TextFormField(
        validator: (field) {
          if(field.isEmpty) {
            return "Please insert a password";
          }
        },
        onSaved: (field) => password = field,
        obscureText: true,
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(icon)
        ),
      );
    }

    TextFormField inputEmail(String title, IconData icon) {
      return TextFormField(
        validator: (field) {
          if(field.isEmpty) {
            return "Please insert an email";
          }
        },
        onSaved: (field) => email = field,
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(icon)
        ),
      );
    }

    Container buttonSection() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: RaisedButton(
                onPressed: () {
                  checkForm();
                },
                elevation: 0,
                color: colorPeach,
                child: Text('Register', style: TextStyle(
                  color: Colors.white70),
                  ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
          );
      }
  }