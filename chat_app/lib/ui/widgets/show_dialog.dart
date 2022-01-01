import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final String title;

  const ShowDialog({ this.title});
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      actions: [
        CupertinoButton(
          onPressed: ()=>Navigator.of(context).pop(),
          child: Text("OK"),
        ),
      ],
      title: Text(
        title,
      ),
      
    );
  }
}