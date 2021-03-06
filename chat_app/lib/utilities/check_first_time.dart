import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');
    

    var _duration = new Duration(microseconds: 1);

    if (firstTime != null && !firstTime) {// Not first time
      return new Timer(_duration, navigationPageHome);
    } else {// First time
      prefs.setBool('first_time', false);
      return new Timer(_duration, navigationPageOnBording);
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  void navigationPageOnBording() {

    Navigator.of(context).pushReplacementNamed('/IntroScreens');
  }
@override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}