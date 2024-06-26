import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manger.dart';
import 'text_utile_widget.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.text, this.height});
  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: TextUtiels(
          text: text,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 24.sp, color: AppColorManger.redColor),
        ),
      ),
    );
  }
}
