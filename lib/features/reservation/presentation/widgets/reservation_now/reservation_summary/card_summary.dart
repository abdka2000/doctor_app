import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/color_manger.dart';
import '../../../../../../core/resources/font_manger.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class CardSummaryWidget extends StatelessWidget {
  const CardSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 40.h,
      ),
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
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //? Card Summary :
              TextUtiels(
                paddingRight: 10.w,
                text: 'الاسم : لمى عبدالله الطويل',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20.sp,
                      fontFamily: AppFontFamily.tajawalMedium,
                    ),
              ),
              Divider(
                color: AppColorManger.black.withOpacity(0.17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextUtiels(
                    paddingRight: 5.w,
                    paddingTop: 12.h,
                    text: '2:15 2023/8/25',
                    color: AppColorManger.colorShowDailogButton,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamily.tajawalMedium,
                  ),
                  TextUtiels(
                    paddingRight: 10.w,
                    paddingTop: 10,
                    text: ': تاريخ الحجز',
                    color: AppColorManger.colorShowDailogButton,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamily.tajawalMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
