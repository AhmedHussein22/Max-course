import 'package:chat_app/utilities/colors.dart';
import 'package:chat_app/utilities/responsive.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function validatorFun;
  final bool issecure;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validatorFun,
    this.issecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(screensize: MediaQuery.of(context));
    double size = _responsive.getwidthsize(MediaQuery.of(context).size.width);
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: size * 0.01),
      padding:
          EdgeInsets.symmetric(horizontal: size * 0.04, vertical: size * 0.01),
      width: size * 0.8,
      decoration: BoxDecoration(
        color: PINK_COLOR,
        borderRadius: BorderRadius.circular(size * 0.06),
      ),
      child: TextFormField(
        obscureText: issecure,
        validator: validatorFun,
        style: theme.textTheme.headline2,
        onChanged: onChanged,
        cursorColor: OFFWhite_COLOR,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: OFFWhite_COLOR,
          ),
          hintText: hintText,
          hintStyle: theme.textTheme.headline2,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
