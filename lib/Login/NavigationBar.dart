
import 'package:flutter/material.dart';
import './Home_screen.dart';


class Nav extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _WidgetOptions = <Widget>[
    HomePage(),
    Text('Page2'),
    Text('Page3'),
  ];

  void _onItemTap(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   //title: Text('Spotler'),
      // ),
      body: Center(
        child: _WidgetOptions.elementAt(_selectedIndex)   //page변환 넣으면 될거같음
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Note',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Play',
         ),
       ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
