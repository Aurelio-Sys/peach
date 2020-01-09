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

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                minRadius: 70,
                maxRadius: 70,
                backgroundImage: AssetImage('assets/images/KrenzCushart.jpg'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text('KrenzCushart', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  Text('KrenzCushart@gmail.com', style: TextStyle(fontSize: 25),),
                ],
              ),
              
            ],
          ),
        ),
      ),
      // Align(
      //   alignment: Alignment.topCenter,
      //   child: Hero(tag: 'gambar',
      //     child: Container(
      //       height: 200,
      //       width: 200,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           fit: BoxFit.cover,
      //           image: AssetImage('assets/images/KrenzCushart.jpg')
      //         )
      //       ),
      //       ),
      //   ),
      // )
    ],
  );

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
      body: bodyWidget(context)
    );
  }
}