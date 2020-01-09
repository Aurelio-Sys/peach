import 'package:flutter/material.dart';
import 'package:peach/model/post.dart';

class ProfileDetail extends StatefulWidget {

  static const routeName = '/profileDetail';
  final Post post;

  ProfileDetail({Key key, this.post}) : assert(post != null), super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    // print();
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          // Text(post)
        ],
      ),
    );
  }
}