import 'package:flutter/material.dart';

//? Function use for Form Filed :
OutlineInputBorder outlineInputBorder(
    {double width = 0, Color color = Colors.transparent, double circular = 5}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(circular),
    borderSide: BorderSide(width: width, color: color),
  );
}
