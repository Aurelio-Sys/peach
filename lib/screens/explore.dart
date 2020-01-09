import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class Explore extends StatefulWidget {
  static const routeName = '/Explore';
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  var url = 'http://apiforpeach.000webhostapp.com/API/getExplore.php';

  List explore;

  fetchExplore() async {
    final res = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(res.body);
      explore = dataConvertedJSON;
    });
  }

  @override
  void initState() {
    fetchExplore();
    super.initState();
    setState(() {
      
    });
  }

  // List data;
  @override
  Widget build(BuildContext context) {
    print(explore);
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
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: explore == null ? 0 : explore.length,
          itemBuilder: (BuildContext context, int index) => new Container(
            child: Card(
              semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(explore[index]['image'],
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
        ),
      )
     );
  }
}