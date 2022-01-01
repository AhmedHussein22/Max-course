import 'package:chat_app/utilities/colors.dart';
import 'package:chat_app/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocalIcon extends StatelessWidget {
  final FaIcon icon;
  final Function press;
  const SocalIcon({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(screensize: MediaQuery.of(context));
    double heightsize = _responsive.getheightsize( MediaQuery.of(context).size.height);
    double widthsize = _responsive.getwidthsize( MediaQuery.of(context).size.width);
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widthsize* 0.06),
        padding: EdgeInsets.all(widthsize*0.05),
        decoration: BoxDecoration(
          border: Border.all(
            width: widthsize*0.01,
            color: PINK_COLOR,
          ),
          shape: BoxShape.circle,
        ),
        child: icon
      ),
    );
  }
}
