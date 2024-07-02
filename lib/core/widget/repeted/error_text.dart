import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import '../../resources/color_manger.dart';
import '../text_utiles/text_utile_widget.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    required this.text,
    this.height,
    required this.onPressed,
  });
  final String text;
  final double? height;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtiels(
            text: text,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 24.sp, color: Colors.grey),
          ),
          SizedBox(
            height: 20.h,
          ),
          MainElevatedButton(
              text: AppWordManger.tryAgain,
              backgroundColor: Colors.grey,
              textColor: AppColorManger.black,
              onPreesed: onPressed)
        ],
      ),
    );
  }
}
