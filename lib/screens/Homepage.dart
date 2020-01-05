import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:peach/colors.dart';
import 'dart:convert';

class Homepage extends StatefulWidget {
  static const routeName = '/Homepage';
  
  @override
  HomepageState createState() => new HomepageState();
}

class HomepageState extends State<Homepage> {

  // List data;
  
  static final List<String> photos = [
    'assets/images/Alice(1).png',
    'assets/images/WLOP.jpg',
    'assets/images/KrenzCushart.jpg',
    'assets/images/WLOP(1).jpg',
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: photos.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            '${fileImage}',
            width: 1000,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    height: 200,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Image.asset('assets/images/peachborder.png',
          height: 30,
          width: 30,),
        )
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 15,
              ),
              autoPlayImage,
              Container(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 15,
                    height: 15,
                  ),
                  Text('News',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: colorPeach
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              Container(
                height: 15,
              ),
              Column(
                children: <Widget>[
                  FutureBuilder(
                    future: DefaultAssetBundle.of(context).loadString('repository/dataRepository.json'),
                    builder: (context, snapshot) {
                      var newData = json.decode(snapshot.data.toString());
                      return ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newData == null ? 0 : newData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            margin: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 8,
                                      width: 5,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                        ),
                                        FloatingActionButton(
                                          onPressed: () {
                                            // Navigator.popAndPushNamed(context, ProfileDetail.routeName);
                                            print('tapped');
                                          },
                                          child: ClipOval(
                                            child: Image.asset(newData[index]['profilePic'],
                                            fit: BoxFit.cover,
                                            width: 40,
                                            height: 40,
                                            ),
                                          ),
                                          mini: true,
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(newData[index]['username'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        Text(newData[index]['posted'],
                                        style: TextStyle(
                                          fontSize: 10
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 10,
                                ),
                                Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(newData[index]['image'],
                                  fit: BoxFit.fill,),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                ),
                                Container(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}