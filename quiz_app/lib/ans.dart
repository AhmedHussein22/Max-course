import 'dart:ffi';

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final   Function onAnswerClick;
  final String answerText;

  const Answer({this.onAnswerClick, this.answerText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onAnswerClick,
        color: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        
      ),
      
    );
  }
}