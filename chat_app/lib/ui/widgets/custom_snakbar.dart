import 'package:chat_app/utilities/colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final bool isSuccessful;

  CustomSnackBar({@required this.message, @required this.isSuccessful});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme=Theme.of(context);
    return Container(
      constraints: BoxConstraints(
        minHeight: 80.0,
        maxHeight: 120.0,
      ),
      decoration: BoxDecoration(
        color: White_COLOR,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            color: OFFWhite_COLOR,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 12.0,
            decoration: BoxDecoration(
              color: isSuccessful ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                message,
                style:_theme.textTheme.headline2
              ),
            ),
          ),
        ],
      ),
    );
  }
}
