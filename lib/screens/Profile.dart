// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peach/screens/loginPage.dart';


class Profile extends StatefulWidget {
  static const routeName = '/Profile';

  const Profile({Key key, this.logout}) : super(key: key);
  final VoidCallback logout;
  
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  logout() {
    setState(() {
      Navigator.of(context).popAndPushNamed(
        LoginPage.routeName
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/peachborder.png',
          width: 30,
          height: 30,)
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.power_settings_new),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 15,
          ),
          Card(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/KrenzCushart.jpg'),
                  radius: 40,
                ),
                Container(
                  height: 12,
                ),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Like',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                            ),
                          Text('3000')
                        ],
                      ),
                      Container(width: 10,),
                      Column(
                        children: <Widget>[
                          Text('Leaf',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                            ),
                          Text('1254')
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}