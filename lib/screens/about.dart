import 'package:flutter/material.dart';
import 'package:peach/colors.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Image.asset('assets/images/peachborder.png',
          height: 30,
          width: 30,),
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            height: 200,
            width: 200,
            child: Image(
              image: AssetImage('assets/images/peachborder.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Text('About',
                style: TextStyle(
                  fontSize: 32,
                  color: colorPeach
                ),),
                Text('Aplikasi ini merupakan aplikasi yang menampilkan gambar untuk mencari artist yang melakukan drawing commission',
                style: TextStyle(
                  fontSize: 26
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}