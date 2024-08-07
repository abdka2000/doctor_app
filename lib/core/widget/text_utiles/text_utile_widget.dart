import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';

class TextUtiels extends StatelessWidget {
  const TextUtiels({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.textAlign,
    this.shadows,
    this.height,
    this.fontWeight,
    this.paddingRight,
    this.paddingBottome,
    this.paddingTop,
    this.paddingLeft,
    this.style,
    this.maxLines,
  });
  final String text;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final FontWeight? fontWeight;
  final double? height;
  final double? paddingRight;
  final double? paddingLeft;
  final double? paddingTop;
  final double? paddingBottome;
  final TextStyle? style;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: paddingRight ?? 0,
        left: paddingLeft ?? 0,
        bottom: paddingBottome ?? 0,
        top: paddingTop ?? 0,
      ),
      child: Text(
        textAlign: textAlign ?? TextAlign.end,
        text,
        maxLines: maxLines,
        style: style ??
            TextStyle(
              // overflow: TextOverflow.fade,
              fontFamily: fontFamily ?? AppFontFamily.tajawalRegular,
              fontSize: fontSize ?? 16.sp,
              color: color ?? AppColorManger.white,
              shadows: shadows,
              height: height,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
        overflow: TextOverflow.visible,
      ),
    );
  }
}
