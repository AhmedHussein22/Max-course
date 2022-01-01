import 'package:chat_app/utilities/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function press;
  final Color color;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = OFFWhite_COLOR,
    
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme=Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          color: widget.color,
          onPressed: widget.press,
          child: Text(
            widget.text,
            style: theme.textTheme.headline1.copyWith(color: BLUE_COLOR,),
          ),
        ),
      ),
    );
  }
}
