import 'package:uhra/database/db.dart';
import 'package:uhra/database/memo.dart';
import 'package:uhra/screens/View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhra/screens/Write.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget section1 = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      '오늘의 운동 추천',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButtonColumn(Colors.black, Icons.call, '운동이름'),
                        _buildButtonColumn(Colors.black, Icons.near_me, '운동이름'),
                        _buildButtonColumn(Colors.black, Icons.share, '운동이름'),
                        _buildButtonColumn(
                            Colors.black, Icons.accessibility, '운동이름')
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 3)],
          borderRadius: BorderRadius.circular(12),
        )
    );


    Widget section2 = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text('운동량 그래프'),
                  maxRadius: 30,
              ),
            )
          ],
        )
    );

    Widget section3 = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'UH-RA?',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            section1,
            section2,
            section3,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}