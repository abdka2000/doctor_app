import 'package:flutter/material.dart';

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(1, size.height);
    path.quadraticBezierTo(
      size.width * 0.11,
      size.height - 55,
      size.width,
      size.height,
    );
    path.quadraticBezierTo(
        size.width * 0.25, size.height - 40, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
