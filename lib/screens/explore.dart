import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:peach/colors.dart';


class Explore extends StatefulWidget {
  static const routeName = '/Explore';
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/peachborder.png',
          width: 30,
          height: 30,
          ),
        ),
      ),
      body: Container(
          child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('repository/dataRepository.json'),
              builder: (context, snapshot) {
                var newData = json.decode(snapshot.data.toString());
                return new StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: newData == null ? 0 : newData.length,
                  itemBuilder: (BuildContext context, int index) => new Container(
                    child: Card(
                      semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(newData[index]['image'],
                        fit: BoxFit.fill,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                    ),
                  ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 3 : 2.5),
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                );
              },
            ),
          ),
        )
    );
  }
}