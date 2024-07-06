import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class CostCardWidget extends StatelessWidget {
  const CostCardWidget({super.key, required this.totalAmount});
  final double totalAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 22.h, bottom: 40.h),
      width: 318.w,
      height: 61.h,
      decoration: BoxDecoration(
        color: AppColorManger.fillColorCard,
        border: Border.all(
          color: AppColorManger.primaryColor,
          width: 1.2.w,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                TextUtiels(
                  text: 'ل.س',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: AppFontFamily.extraBold,
                        fontSize: 20.sp,
                      ),
                ),
                TextUtiels(
                  text: '$totalAmount',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: AppFontFamily.extraBold,
                        fontSize: 20.sp,
                      ),
                ),
              ],
            ),
          ),
          TextUtiels(
            paddingRight: 15.w,
            text: AppWordManger.fullCost,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xff4D4D4D),
                  fontSize: 16.sp,
                  fontFamily: AppFontFamily.extraBold,
                ),
          ),
        ],
      ),
    );
  }
}
