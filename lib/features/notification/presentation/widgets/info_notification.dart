import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import 'icon_notification_widget.dart';

class InfoNotificationWidget extends StatelessWidget {
  const InfoNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 82.h,
      color: AppColorManger.colorButtonShowDailog,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //?This is From Api
                TextUtiels(
                  text: 'قم بتسجيل الدخول لخدمات أكثر',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 14.sp),
                ),
                TextUtiels(
                  text: '19/9/2023',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 12.sp,
                        color: AppColorManger.gray,
                      ),
                ),
              ],
            ),
          ),
          //? Icon Notification :
          const IconNotificationWidget(),
        ],
      ),
    );
  }
}
