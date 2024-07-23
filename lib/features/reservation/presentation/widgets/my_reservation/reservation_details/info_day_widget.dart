import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/features/reservation/domain/entities/availabe_day/available_days.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/times_for_day/times_for_day_cubit.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/resources/color_manger.dart';
import '../../../../../../core/resources/font_manger.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoDayWidget extends StatefulWidget {
  const InfoDayWidget({super.key, required this.days});
  final List<AvailableDays> days;
  @override
  State<InfoDayWidget> createState() => _InfoDayWidgetState();
}

AvailableDays? selectedDay;

class _InfoDayWidgetState extends State<InfoDayWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: SizedBox(
        height: 63.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          reverse: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: widget.days.length,
          separatorBuilder: (context, index) => SizedBox(width: 11.w),
          itemBuilder: (context, index) {
            final dateTime = DateTime.parse(widget.days[index].date!);
            return GestureDetector(
              onTap: () {
                selectedDay = widget.days[index];
                setState(() {
                  selectedIndex = index;
                  context
                      .read<TimesForDayCubit>()
                      .getTimes(date: widget.days[index].date);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == index
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
                      EdgeInsets.symmetric(horizontal: 33.w, vertical: 8.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextUtiels(
                        paddingBottome: 5.h,
                        text: widget.days[index].name ?? '',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: selectedIndex == index
                                      ? AppColorManger.white
                                      : AppColorManger.black,
                                  fontSize: 10.sp,
                                  fontWeight:
                                      AppFontWeightManger.fontWeightSemiBold,
                                ),
                      ),
                      TextUtiels(
                        text: DateFormat('yyyy/MM/dd').format(dateTime),
                        // widget.days[index].date!.replaceRange(10, null, ""),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: selectedIndex == index
                                  ? AppColorManger.white
                                  : AppColorManger.black,
                              fontSize: 11.sp,
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
