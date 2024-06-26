import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoMonyAccountWidget extends StatelessWidget {
  const InfoMonyAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: 3,
      padding: EdgeInsets.only(top: 20.h),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  TextUtiels(
                    text: 'ل.س',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: AppFontFamily.extraBold,
                          fontSize: 20.sp,
                        ),
                  ),
                  TextUtiels(
                    text: '50,000',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: AppFontFamily.extraBold,
                          fontSize: 20.sp,
                        ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtiels(
                  text: 'لمى الطويل',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 15.sp,
                        color: AppColorManger.textGray,
                      ),
                ),
                TextUtiels(
                  text: '2:15 2023/8/25',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 10.sp,
                        color: AppColorManger.colorShowDailogButton,
                      ),
                ),
              ],
            ),
            //? Icon :
            Container(
              width: 26.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColorManger.secoundryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
            )
          ],
        );
      },
    );
  }
}
