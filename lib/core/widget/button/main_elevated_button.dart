import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text_utiles/text_utile_widget.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.onPreesed,
      this.horizontalPadding,
      this.verticalPadding,
      this.raduiseBorder});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPreesed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? raduiseBorder;

  @override
  Widget build(BuildContext context) {
    //! Button All App
    return ElevatedButton(
      onPressed: onPreesed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduiseBorder ?? 20).r,
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 11.5.w,
          horizontal: horizontalPadding ?? 85.5.w,
        ),
        backgroundColor: backgroundColor,
      ),
      child: TextUtiels(
        text: text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16.sp,
            ),
      ),
    );
  }
}
