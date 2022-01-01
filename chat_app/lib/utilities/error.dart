import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      child:Center(
        child:Column(
          children: [
            Icon(CupertinoIcons.alarm),
            Text(
              "OPPS Error occurred",
              style: _theme.textTheme.headline1,
            )
          ],
        ),
        )
      
    );
  }
}