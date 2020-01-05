import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peach/colors.dart';
import 'package:peach/screens/bottomNavigation.dart';
import 'package:peach/screens/registerPage.dart';


class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginStatus {
  hasNotLogin,
  login
}

class _LoginPageState extends State<LoginPage> {
  bool visible = true;
  String username, password;
  LoginStatus _loginStatus = LoginStatus.hasNotLogin;

  fieldVisible() {
    setState(() {
      visible = !visible;
    });
  }

  final _key = new GlobalKey<FormState>();

  checkForm() {
    final form = _key.currentState;
    if(form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post('https://apiforpeach.000webhostapp.com/API/login.php', body: {
      "username": username,
      "password": password
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String msg = data['message'];
    if(value==1) {
      setState(() {
        _loginStatus = LoginStatus.login;
      });
      print(msg);
    } else {
      print(msg);
    }
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    switch(_loginStatus) {
      case LoginStatus.hasNotLogin:
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
                  inkWellSection()
                ],
              ),
            )
          )
        );
      break;
      case LoginStatus.login:
        return BottomNavigation();
      break;
    }
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
            inputPassword('Password', Icons.lock)
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
        obscureText: visible,
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(icon),
          suffixIcon: IconButton(
            onPressed: fieldVisible,
            icon: Icon(
              visible ? Icons.visibility_off : Icons.visibility
            ),
          )
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
                child: Text('Login', style: TextStyle(
                  color: Colors.white70),
                  ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
          );
      }

    Container inkWellSection() {
      return Container(
        height: 20,
        margin: EdgeInsets.only(top: 15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RegisterPage())
            );
          },
          child: Text("Don't have an account ? Create one!", style: TextStyle(
            color: Colors.white70),
            textAlign: TextAlign.center,),
        ),
      );
    }
  }
