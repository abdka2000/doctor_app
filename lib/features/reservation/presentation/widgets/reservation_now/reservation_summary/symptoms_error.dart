import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class SymptomsError extends StatelessWidget {
  const SymptomsError({super.key, required this.text, required this.onPreesed});
  final String text;
  final void Function()? onPreesed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextUtiels(
          text: text,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 18.sp, color: Colors.grey),
        ),
        SizedBox(
          height: 20.h,
        ),
        MainElevatedButton(
            horizontalPadding: 20.w,
            text: AppWordManger.tryAgain,
            backgroundColor: Colors.grey,
            textColor: AppColorManger.black,
            onPreesed: onPreesed)
      ],
    );
  }
}
