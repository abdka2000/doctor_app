import 'package:flutter/material.dart';
import '../resources/color_manger.dart';
import '../resources/font_manger.dart';

//! them app use this is for (dark theme or light theme switched)
final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColorManger.primaryColor,
  ),
  dialogBackgroundColor: AppColorManger.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: AppFontFamily.tajawalBold,
      color: AppColorManger.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFontFamily.tajawalMedium,
      color: AppColorManger.white,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFontFamily.tajawalRegular,
      color: AppColorManger.primaryColor,
    ),
    displayLarge: TextStyle(
      fontFamily: AppFontFamily.tajawalBold,
      color: AppColorManger.primaryColor,
    ),
    displayMedium: TextStyle(
      fontFamily: AppFontFamily.tajawalLight,
      color: AppColorManger.black,
    ),
    displaySmall: TextStyle(
      fontFamily: AppFontFamily.tajawalRegular,
      color: AppColorManger.black,
    ),
    labelLarge: TextStyle(
      fontFamily: AppFontFamily.tajawalBold,
      color: AppColorManger.black,
    ),
    labelMedium: TextStyle(
      fontFamily: AppFontFamily.tajawalMedium,
      color: AppColorManger.black,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFontFamily.tajawalRegular,
      color: AppColorManger.textColor2,
    ),
  ),
);
