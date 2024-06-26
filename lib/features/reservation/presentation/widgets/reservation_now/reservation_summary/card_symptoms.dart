import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/resources/color_manger.dart';
import '../../../../../../core/resources/svg_manger.dart';
import '../../../../../../core/resources/word_manger.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class CardSymptomsWidget extends StatelessWidget {
  const CardSymptomsWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          decoration: BoxDecoration(
            color: AppColorManger.fillColorCard,
            border: Border.all(
              color: AppColorManger.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  width: 12.spMin,
                  height: 10.spMin,
                  AppSvgManger.iconDropDowan,
                ),
                TextUtiels(
                  text: AppWordManger.whaAreTheTheSymptomsYouAreShowing,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontSize: 16.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
