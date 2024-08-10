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
    this.isScrollable = true,
  });
  final String text;
  final double? height;
  final void Function()? onPressed;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isScrollable ? 400.h : height,
      width: double.infinity,
      child:
          isScrollable ? errorScrollable(context) : errorNonScrollable(context),
    );
  }

  ListView errorScrollable(BuildContext context) {
    return ListView(
      
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 120.h),
              child: TextUtiels(
                text: text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 24.sp, color: Colors.grey),
              ),
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
      ],
    );
  }

  Widget errorNonScrollable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: TextUtiels(
            text: text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 24.sp, color: Colors.grey),
          ),
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
    );
  }
}
