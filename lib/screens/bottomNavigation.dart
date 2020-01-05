import 'package:flutter/material.dart';
import 'package:peach/colors.dart';
import 'package:peach/screens/Homepage.dart';
import 'package:peach/screens/Profile.dart';
import 'package:peach/screens/explore.dart';

class BottomNavigation extends StatefulWidget {
  static const routeName = '/bottomNavigation';

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 1;

  List<Widget> layoutPage = [
    Explore(),
    Homepage(),
    Profile(),
  ];

  void onTappedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: layoutPage.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
            backgroundColor: colorPeach
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: colorPeach
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
            backgroundColor: colorPeach
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: onTappedItem,
      ),
    );
  }
}