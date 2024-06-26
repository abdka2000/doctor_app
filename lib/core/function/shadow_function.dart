//! All Custom Function :
import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';

//? shadow for text :
Shadow shadowText({
  Color? color,
  Offset offset = Offset.zero,
  double blurRadius = 0.0,
}) {
  return Shadow(
    color: color ?? AppColorManger.black,
    offset: offset,
    blurRadius: blurRadius,
  );
}
