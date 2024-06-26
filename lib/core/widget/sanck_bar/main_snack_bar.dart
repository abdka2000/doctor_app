import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';
import '../text_utiles/text_utile_widget.dart';

class SnackBarUtil {
  //! function snack bar
  static void showSnackBar({
    required String message,
    String? details,
    required BuildContext context,
    bool isSucces = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColorManger.white,
        content: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 10.sp,
          ),
          //! Text Snack Bar
          child: Align(
            alignment: Alignment.center,
            child: TextUtiels(
              text: "$message \n ${details ?? ""}",
              fontFamily: AppFontFamily.tajawalBold,
              fontSize: 13.sp,
              color:isSucces? const Color.fromARGB(255, 35, 182, 39):AppColorManger.redColor,
            ),
          ), //!
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSucces? const Color.fromARGB(255, 35, 182, 39):AppColorManger.redColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
