import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/font_manger.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../../domain/entities/available_times/available_times.dart';

class InfoDaysAndTimesWidget extends StatelessWidget {
  const InfoDaysAndTimesWidget({super.key, required this.times});
  final List<AvailableTimes> times;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: ListView.separated(
        itemCount: times.length,
        separatorBuilder: (context, index) => SizedBox(height: 9.h),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtiels(
                  text: times[index].fromTime!,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: AppFontWeightManger.fontWeightSemiBold,
                      ),
                ),
                TextUtiels(
                  text: 'اليوم',
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
