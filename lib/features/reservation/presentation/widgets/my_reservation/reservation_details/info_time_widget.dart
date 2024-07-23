import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/features/reservation/domain/entities/available_times/available_times.dart';
import '../../../../../../core/resources/color_manger.dart';
import '../../../../../../core/resources/font_manger.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoTimesWidget extends StatefulWidget {
  const InfoTimesWidget({super.key, required this.times});
  final List<AvailableTimes> times;
  @override
  State<InfoTimesWidget> createState() => _InfoTimesWidgetState();
}

AvailableTimes? selectedTime;

class _InfoTimesWidgetState extends State<InfoTimesWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // selectedTime ??= widget.times[selectedIndex];
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: SizedBox(
        height: 50.h,
        child: ListView.separated(
          reverse: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: widget.times.length,
          separatorBuilder: (context, index) => SizedBox(width: 11.w),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedTime = widget.times[index];
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? AppColorManger.primaryColor
                      : AppColorManger.white,
                  border: Border.all(
                    color: AppColorManger.primaryColor,
                    width: 2.w,
                  ),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtiels(
                        text: " ${widget.times[index].fromTime!} ",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: index == selectedIndex
                                  ? AppColorManger.white
                                  : AppColorManger.black,
                              fontSize: 11.sp,
                              fontWeight:
                                  AppFontWeightManger.fontWeightExtraBold,
                            ),
                      ),
                      TextUtiels(
                        // paddingBottome: 5.h,
                        text: ": الساعة ",
                        // paddingTop: 2.h,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: index == selectedIndex
                                  ? AppColorManger.white
                                  : AppColorManger.black,
                              fontSize: 10.sp,
                              fontWeight:
                                  AppFontWeightManger.fontWeightExtraBold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
