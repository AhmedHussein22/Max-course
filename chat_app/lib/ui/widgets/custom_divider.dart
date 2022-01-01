import 'package:chat_app/utilities/colors.dart';
import 'package:chat_app/utilities/responsive.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(screensize: MediaQuery.of(context));
    double heightsize = _responsive.getheightsize( MediaQuery.of(context).size.height);
    double widthsize = _responsive.getwidthsize( MediaQuery.of(context).size.width);
    ThemeData _theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: heightsize* 0.02),
      width: widthsize * 0.75,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: _theme.textTheme.headline2
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: OFFWhite_COLOR,
        height: 1.5,
      ),
    );
  }
}
