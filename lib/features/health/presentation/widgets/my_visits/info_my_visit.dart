import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoMyVisit extends StatelessWidget {
  const InfoMyVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextUtiels(
          paddingLeft: 50.w,
          paddingBottome: 10.h,
          paddingTop: 20.h,
          text: 'الزيارة 1',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 20.sp,
              ),
        ),
        //? Day :
        Row(
          children: [
            TextUtiels(
              paddingRight: 7.w,
              text: '30/9/2023',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
            SizedBox(width: 29.w),
            TextUtiels(
              text: 'الثلاثاء',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
          ],
        ),
        //? hour :
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextUtiels(
              text: 'صباحا',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
            TextUtiels(
              text: '09:00 ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
            SizedBox(width: 29.w),
            TextUtiels(
              text: ':الساعة',
              paddingRight: 8.w,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
