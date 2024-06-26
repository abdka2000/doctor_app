import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../resources/color_manger.dart';

EdgeInsetsGeometry paddingWordUnSelected({
  required int index,
  required selectedIndex,
}) {
  if (selectedIndex != index) {
    return EdgeInsets.only(top: 15.h);
  } else {
    return const EdgeInsets.only(top: 0.0);
  }
}

//? function for change color as soon as active :
Color changeColorIconFun({
  required int index,
  required selectedIndex,
}) {
  return selectedIndex == index
      ? AppColorManger.white
      : AppColorManger.primaryColor;
}

//? function for remove label text as soon as active :
String removeLabelIconFun({
  required int index,
  required selectedIndex,
  required String labelWord,
}) {
  return selectedIndex == index ? '' : labelWord;
}
