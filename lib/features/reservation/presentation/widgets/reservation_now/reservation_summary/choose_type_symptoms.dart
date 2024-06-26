import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/word_manger.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class ButtonDoneAndCancle extends StatelessWidget {
  const ButtonDoneAndCancle({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, bottom: 12.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            TextUtiels(
              paddingRight: 27.w,
              text: AppWordManger.done,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
            TextUtiels(
              text: AppWordManger.cancle,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
