import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';

class MovPageText extends StatelessWidget {
  const MovPageText({
    super.key,
    required this.onTap,
    required this.movPageText,
    required this.primaryText,
  });
  final void Function() onTap;
  final String movPageText;
  final String primaryText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: TextUtiels(
            text: movPageText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: AppFontSizeManger.s10,
                  height: 4.h,
                ),
          ),
        ),
        SizedBox(width: 8.w),
        TextUtiels(
          fontFamily: AppFontFamily.tajawalLight,
          text: primaryText,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 10.sp,
              ),
        ),
      ],
    );
  }
}
