import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';

class LabelTextFormFiled extends StatelessWidget {
  const LabelTextFormFiled({
    super.key,
    required this.text,
    required this.paddingTop,
    this.paddingRight,
  });
  final String text;
  final double paddingTop;
  final double? paddingRight;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(top: paddingTop.h, right: paddingRight ?? 51.w),
      child: TextUtiels(
        text: text,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontFamily: AppFontFamily.tajawalRegular,
              fontSize: 13.sp,
              fontWeight: AppFontWeightManger.fontWeightExtraBold,
            ),
      ),
    );
  }
}
