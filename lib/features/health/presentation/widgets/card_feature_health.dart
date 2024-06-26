import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';

class CardFeatureHealth extends StatelessWidget {
  const CardFeatureHealth(
      {super.key, required this.cardText, required this.onTap});
  final String cardText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: Container(
          width: 318.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColorManger.fillColorCard,
            border: Border.all(
              color: AppColorManger.primaryColor,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: SvgPicture.asset(
                  width: 10.w,
                  height: 22.h,
                  AppSvgManger.iconArrowProfile,
                ),
              ),
              TextUtiels(
                paddingRight: 16.w,
                text: cardText,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
