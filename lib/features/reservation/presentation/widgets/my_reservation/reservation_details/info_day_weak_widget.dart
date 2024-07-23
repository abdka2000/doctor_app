import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/result.dart';
import '../../../../../../core/resources/font_manger.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoDaysAndTimesWidget extends StatelessWidget {
  const InfoDaysAndTimesWidget({super.key, required this.hours});
  final List<Result> hours;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: ListView.separated(
        itemCount: hours.length,
        separatorBuilder: (context, index) => SizedBox(height: 9.h),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtiels(
                  // text: hours[index].fromTime?.replaceRange(5, null, '') ?? '',
                  text:
                      '${hours[index].fromTime?.replaceRange(5, null, '')}_${hours[index].toTime?.replaceRange(5, null, '')}',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: AppFontWeightManger.fontWeightSemiBold,
                      ),
                ),
                TextUtiels(
                  text: hours[index].dayName ?? '',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: AppFontWeightManger.fontWeightSemiBold,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
