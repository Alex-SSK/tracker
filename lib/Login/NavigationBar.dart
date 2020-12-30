import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:loginapp/loginpage.dart';
import './Home_screen.dart';
import './signin_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
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
      appBar: AppBar(
        title: Text(
        "어라(UH-RA)"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                final User user = await _auth.currentUser;
                if (user == null) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                _signOut();
                final String uid = user.uid;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(uid + ' has successfully signed out.'),
                ));
                await new Future.delayed(const Duration(seconds : 1));
                _pushPage(context, login_page());    //Sign-In google을 했을 때, 홈화면으로 전환
              },
            );
          })
        ],
      ),
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
  void _signOut() async {
    await _auth.signOut();
  }
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
