import 'package:flutter/material.dart';

class Responsive {
  MediaQueryData screensize;
  Responsive({this.screensize});
  double getwidthsize(double widthsize) {
    Orientation orientation = screensize.orientation;
    if (orientation == Orientation.landscape) {
      widthsize = screensize.size.height;
    } else {
      widthsize = screensize.size.width;
    }
    //for tablat
    if (widthsize > 600) {
      return widthsize / 1.5;
    } else {
      return widthsize;
    }
  }
  double getheightsize(double heightsize){
    heightsize=screensize.size.height;
    return heightsize;
  }
}
