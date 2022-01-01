import 'package:chat_app/utilities/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    primaryColor: BLUE_COLOR,
    accentColor: White_COLOR,
    scaffoldBackgroundColor: BLUE_COLOR,
    fontFamily: "Play",
    appBarTheme: AppBarTheme(
      color: ORANG_COLOR,
      elevation: 0.0,
      centerTitle: true,
    ),
    
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: White_COLOR,
      ),
      headline2: TextStyle(
        fontSize: 17,
        color: OFFWhite_COLOR,
        
      ),
    ),
  );
}
