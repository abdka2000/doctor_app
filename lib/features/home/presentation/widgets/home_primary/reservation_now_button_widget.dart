import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class ReservationNowButtonWidget extends StatelessWidget {
  const ReservationNowButtonWidget({
    super.key,
    required this.text,
    this.marginLeft,
  });
  final String text;
  final double? marginLeft;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 130.w,
        height: 45.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: marginLeft ?? 28.w,
        ),
        decoration: ShapeDecoration(
          color: AppColorManger.primaryColor.withOpacity(0.98),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
        child: TextUtiels(
          text: text,
          fontFamily: AppFontFamily.extraBold,
          color: AppColorManger.white,
          fontSize: AppFontSizeManger.s18,
        ),
      ),
    );
  }
}
