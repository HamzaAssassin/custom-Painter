import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    Path path = Path();
    path.lineTo(width, 0);
    path.lineTo(width * 0.5, height);
    // path.lineTo(width, heigh);
    // path.arcTo(Rect.fromLTWH(0,0,width, height), degreeToRadian(0),degreeToRadian(359), false);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

  double degreeToRadian(double degree) {
    var value = pi * degree / 180;
    return value;
  }
}
