import '../login/body.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function viewstate;

  const Login({ this.viewstate});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
       body: Body(),
      ),
    );
  }
}