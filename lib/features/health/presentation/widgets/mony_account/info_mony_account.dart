import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/item.dart';
import 'package:intl/intl.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoMonyAccountWidget extends StatelessWidget {
  const InfoMonyAccountWidget({super.key, required this.items});
  final List<Item> items;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: items.length,
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
                    text: items[index].amount.toString(),
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
                  text: AppSharedPreferences.getName(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 15.sp,
                        color: AppColorManger.textGray,
                      ),
                ),
                TextUtiels(
                  text: DateFormat.yMd()
                      .add_jm()
                      .format(items[index].creationTime ?? DateTime.now()),
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
