import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  const Question({Key key, this.question}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        question,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
          ),
      ),
      
    );
  }
}