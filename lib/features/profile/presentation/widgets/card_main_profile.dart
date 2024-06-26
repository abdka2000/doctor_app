import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';

class CardMainProfile extends StatelessWidget {
  const CardMainProfile(
      {super.key,
      required this.text,
      required this.onTap,
      required this.paddingLeft});
  final String text;
  final void Function()? onTap;
  final double paddingLeft;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          width: 318.w,
          height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColorManger.white,
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: AppColorManger.colorBox,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //? Icon Arrow Profile :
              SvgPicture.asset(
                width: 25.w,
                height: 25.h,
                AppSvgManger.iconArrowProfile,
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingLeft.w),
                child: TextUtiels(
                  text: text,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: AppFontFamily.extraBold,
                        fontSize: 14.5.sp,
                      ),
                ),
              ),
              SvgPicture.asset(
                width: 25.w,
                height: 25.h,
                AppSvgManger.iconCircularProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
