
import 'package:chat_app/model/Userinfo.dart';
import 'package:chat_app/ui/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'signup/signup.dart';

class Warpper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);

    if (user != null) {
      return Home();
    } else {
      return SignUp();
    }
  }
}

