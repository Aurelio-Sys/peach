import 'package:flutter/material.dart';
import 'package:peach/colors.dart';
import 'package:peach/screens/Profile.dart';
import 'package:peach/screens/explore.dart';
import 'package:peach/screens/loginPage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:peach/screens/bottomNavigation.dart';
import 'package:peach/screens/Homepage.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Peach',
    theme: ThemeData(
      primaryColor: Colors.white
    ),
    initialRoute: '/',
    routes: {
      '/' : (context) => MyApp(),
      Homepage.routeName : (context) => Homepage(),
      BottomNavigation.routeName : (context) => BottomNavigation(),
      Explore.routeName : (context) => Explore(),
      Profile.routeName : (context) => Profile(),
      LoginPage.routeName : (context) => LoginPage()
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      image: new Image.asset('assets/images/peachborder.png'),
      title: Text('Peach',
      style: TextStyle(
        color: colorPeach,
        fontSize: 20
        ),
      ),
      photoSize: 50.0,
      seconds: 5,
      navigateAfterSeconds: new LoginPage(),
      // title: new Text(this.title,    
      // style: new TextStyle(
      //   fontWeight: FontWeight.bold,
      //   fontSize: 20,
      //   color: Colors.pinkAccent
      //   ),
      // ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      onClick: ()=> print('Wait a moment please'),
      loaderColor: colorPeach,
    );
  }
}