import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class CaptionTextWidget extends StatelessWidget {
  const CaptionTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: TextUtiels(
          fontFamily: AppFontFamily.tajawalBold,
          color: AppColorManger.primaryColor,
          text: text,
          fontSize: AppFontSizeManger.s24,
        ),
      ),
    );
  }
}
