import 'package:flutter/material.dart';
import './Home_screen.dart';

class Nav extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _WidgetOptions = <Widget>[
    Text('달려라'),
    Text('들어라'),
    HomePage(),
    Text('먹어라'),
    Text('설정'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _WidgetOptions.elementAt(_selectedIndex) //page변환 넣으면 될거같음
          ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run,),
            backgroundColor: Colors.white,
            label: '달려라',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward_outlined),
            backgroundColor: Colors.white,
            label: '들어라',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            backgroundColor: Colors.white,
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            backgroundColor: Colors.white,
            label: '먹어라',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            backgroundColor: Colors.white,
            label: '설정',
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 20),
        selectedItemColor: Colors.orangeAccent,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
