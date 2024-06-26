import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/font_manger.dart';
import '../text_utiles/text_utile_widget.dart';

class ButtonShowDeailog extends StatelessWidget {
  const ButtonShowDeailog({
    super.key,
    required this.textButton,
    required this.textColor,
    required this.buttonColor,
    required this.onTap,
  });
  final String textButton;
  final Color textColor;
  final Color buttonColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 111.w,
        height: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: buttonColor,
        ),
        child: TextUtiels(
          text: textButton,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 16.sp,
                color: textColor,
                fontFamily: AppFontFamily.extraBold,
              ),
        ),
      ),
    );
  }
}
