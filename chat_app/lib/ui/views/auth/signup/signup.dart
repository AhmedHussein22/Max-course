import 'package:chat_app/ui/views/auth/signup/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Body(),
      ),
    );
  }
}
