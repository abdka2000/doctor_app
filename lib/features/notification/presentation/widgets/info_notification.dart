import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/item.dart';
import 'package:intl/intl.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import 'icon_notification_widget.dart';

class InfoNotificationWidget extends StatelessWidget {
  const InfoNotificationWidget({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 82.h,
      color: (item.isReaded ?? false)
          ? AppColorManger.fillColor
          : AppColorManger.colorButtonShowDailog,
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
                  // text: 'قم بتسجيل الدخول لخدمات أكثر',
                  text: item.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 14.sp),
                ),
                TextUtiels(
                  // text: '19/9/2023',
                  text: DateFormat('dd/MM/yyyy')
                      .format(item.creationTime ?? DateTime.now()),
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
