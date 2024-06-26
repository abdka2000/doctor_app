import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/color_manger.dart';
import '../../resources/svg_manger.dart';
import 'button_show_deailog.dart';
import '../text_utiles/text_utile_widget.dart';

class MainShowDialog {
  static void customShowDialog(
    BuildContext context, {
    required void Function()? onTapFirst,
    required void Function()? onTapSecound,
    required String firstButtonText,
    required String secoundButtonText,
    required String textPopUp,
    double? hieght,
    bool? barrierDismissible,
    required void Function() onTapBack,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? true,
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
            onTap: onTapBack,
            child: SvgPicture.asset(
              alignment: Alignment.centerLeft,
              AppSvgManger.iconArrow,
              width: 30.w,
              height: 30.h,
            ),
          ),
          content: Container(
            // width: 313.w,
            height: hieght ?? 200.h,
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
                TextUtiels(
                  paddingTop: 20.h,
                  paddingBottome: 30.h,
                  text: textPopUp,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        color: AppColorManger.backGroundColorShowDialog,
                      ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //? Yes :
                    ButtonShowDeailog(
                      onTap: onTapFirst,
                      buttonColor: AppColorManger.fillColorCard,
                      textButton: firstButtonText,
                      textColor: AppColorManger.colorShowDailogButton,
                    ),
                    //? Cansle :
                    SizedBox(width: 23.w),
                    ButtonShowDeailog(
                      onTap: onTapSecound,
                      buttonColor: AppColorManger.colorButtonShowDailog,
                      textButton: secoundButtonText,
                      textColor: AppColorManger.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
