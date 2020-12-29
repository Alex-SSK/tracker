import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool _isStared = false;
  int _count = 41;

  @override
  Widget build(BuildContext context) {
    var titleSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            Text("Kandresteg Switzerland",
                style: TextStyle(color: Colors.grey, fontSize: 26)),
          ],
        ),
        Padding(padding: EdgeInsets.all(10.0)),
        IconButton(
          onPressed: _pressedStar,
          icon: (_isStared ? Icon(Icons.star) : Icon(Icons.star_border)),
          iconSize: 45,
          color: Colors.red[500],
        ),
        Text(
          "$_count",
          style: TextStyle(fontSize: 30),
        ),
      ],
    );

    var buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              Icons.call,
              size: 45,
              color: Colors.blue,
            ),
            Text(
              "CALL",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            Icon(Icons.near_me, size: 45, color: Colors.blue),
            Text(
              "ROUTE",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            Icon(Icons.share, size: 45, color: Colors.blue),
            Text(
              "SHARE",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ],
    );

    var textSection = Container(
        child: Text(
            'Spotler',
            style: TextStyle(fontSize: 20)),
        padding: EdgeInsets.all(30.0));

    return Scaffold(
        body: Column(
      children: <Widget>[
        Image(
          image: AssetImage('pic/pic1.png'),
          height: 240,
          width: 600,
          fit: BoxFit.cover,
        ),
        //이미지 삽입
        Padding(padding: EdgeInsets.all(15.0)),
        titleSection,
        Padding(padding: EdgeInsets.all(15.0)),
        buttonSection,
        //Padding(padding: EdgeInsets.all(15.0)),
        textSection,
      ],
    ));
  }

  void _pressedStar() {
    setState(() {
      if (_isStared) {
        _isStared = false;
        _count -= 1;
      } else {
        _isStared = true;
        _count += 1;
      }
    });
  }
}
