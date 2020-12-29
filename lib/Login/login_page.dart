import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import './register_page.dart';
import './signin_page.dart';
import './loginpage.dart';

class login_page extends StatelessWidget {
  // Navigates to a new page
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("어라(UH-RA)"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 50)),
          Center(
            child: Image(
              image: AssetImage('pic/login.gif'),
              width: 180.0,
              height: 180.0,
            ),
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.person_add, fontSize: 20, height: 60, width: 300,
              backgroundColor: Colors.indigo,
              text: '회원가입', elevation: 0,
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            padding: const EdgeInsets.only(top: 400),
            alignment: Alignment.center,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.verified_user, fontSize: 20, height: 60, width: 300,
              backgroundColor: Colors.orange,
              text: '로그인', elevation: 0,
              onPressed: () => _pushPage(context, SignInPage()),
            ),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
