import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import './register_page.dart';
import './signin_page.dart';

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
        title: Text(
          "어라(UH-RA)",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 50)),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('pic/login.gif'),
              radius: 100.0,
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 50)),
          Container(
            child: Text(
              "안녕하세요. 어라(UH-RA)에 오신 것을 환영합니다\n만 14세 미만은 법정대리인 동의 후 회원서비스 이용이 가능합니다.\n선택약관에 동의하지 않아도 회원가입은 가능합니다.",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                fontSize: 16,
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              fontSize: 20,
              height: 60,
              width: 300,
              backgroundColor: Colors.indigo,
              text: '회원가입',
              elevation: 0,
              splashColor: Colors.red,
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            padding: const EdgeInsets.only(top: 300),
            alignment: Alignment.center,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.login,
              fontSize: 20,
              height: 60,
              width: 300,
              backgroundColor: Colors.orange,
              text: '로그인',
              elevation: 0,
              splashColor: Colors.red,
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
