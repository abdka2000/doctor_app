import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class MainShowDialogCansleResevation {
  static void customShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: AppColorManger.white,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0).r,
          ), //
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              alignment: Alignment.centerLeft,
              AppSvgManger.iconArrow,
              width: 30.w,
              height: 30.h,
            ),
          ),
          content: Container(
            height: 170.h,
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                children: [
                  TextUtiels(
                    text: AppWordManger.sorryToCancelTheReservationPlease,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          color: AppColorManger.backGroundColorShowDialog,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  TextUtiels(
                    text: AppWordManger.contactUsWithAVoiceCall,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          color: AppColorManger.backGroundColorShowDialog,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  TextUtiels(
                    text: AppWordManger.thanks,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          color: AppColorManger.lightColor.withOpacity(0.67),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      width: 52.w,
                      height: 52.h,
                      AppSvgManger.iconReservation,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
