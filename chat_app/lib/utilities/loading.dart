import 'package:chat_app/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: OFFWhite_COLOR,
      child: Center(
       child: CupertinoActivityIndicator(
         radius: 20,
       )
      ),
    );
  }
}