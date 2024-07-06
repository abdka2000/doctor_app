import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class FiledDescriptionMedical extends StatelessWidget {
  const FiledDescriptionMedical({
    super.key,
    required this.nameMedicine,
    required this.periodOfUse,
    required this.timeOfUse,
    required this.showText,
  });
  final String nameMedicine;
  final String periodOfUse;
  final String timeOfUse;
  final bool showText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 18.h),
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorManger.secoundryColor,
          width: 1.2.w,
        ),
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TextUtiels(
              paddingRight: 20.w,
              text: nameMedicine,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 14.sp,
                  ),
            ),
          ),
          TextUtiels(
            paddingRight: 11.w,
            text: periodOfUse,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10.sp,
                ),
          ),
          Visibility(
            visible: showText,
            replacement: Container(
              alignment: Alignment.center,
              width: 30.w,
              height: 5.h,
              color: AppColorManger.secoundryColor,
            ),
            child: TextUtiels(
              paddingRight: 5.w,
              text: AppWordManger.afterFood,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10.sp,
                  ),
            ),
          ),
          TextUtiels(
            text: timeOfUse,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10.sp,
                ),
          ),
        ],
      ),
    );
  }
}
