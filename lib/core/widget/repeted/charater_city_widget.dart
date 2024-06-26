import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';
import '../../resources/word_manger.dart';
import '../text_utiles/text_utile_widget.dart';

class CharacterCityWidget extends StatelessWidget {
  const CharacterCityWidget({
    super.key,
    this.paddingbottome,
    this.paddingTop,
  });
  final double? paddingbottome;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: paddingTop ?? 16.h,
        bottom: paddingbottome ?? 13.h,
        left: 16.w,
        right: 16.w,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorManger.primaryColor,
        borderRadius: BorderRadius.circular(18).r,
      ),
      child: TextUtiels(
        text: AppWordManger.characterCity,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: AppFontWeightManger.fontWeightBold,
            ),
      ),
    );
  }
}
