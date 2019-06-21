import 'package:flutter/material.dart';
import 'main.dart';
class detailscreen extends StatefulWidget {
  @override
  _detailscreenState createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zawtar'),),
      body: ListView(
        children: <Widget>[
          Image.network(imagenamee),
          Text(titlee,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0
          ),),
          Text(detailss,
            style: TextStyle(

                fontSize: 20.0
            ),),

        ],
      ),
    );
  }
}
