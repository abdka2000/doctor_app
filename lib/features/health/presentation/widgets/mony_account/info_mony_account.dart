// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/item.dart';
import 'package:intl/intl.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoMonyAccountWidget extends StatelessWidget {
  const InfoMonyAccountWidget(
      {super.key,
      required this.items,
      required this.hasReachedMax,
      required this.controller});
  final List<Item> items;
  final bool hasReachedMax;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: items.length + 1,
      padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 5.w),
      itemBuilder: (context, index) {
        if (index == items.length && !hasReachedMax)
          return const MainLoadignWidget();
        else if (index == items.length && hasReachedMax)
          return null;
        else
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextUtiels(
                      text: 'ل.س',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: AppFontFamily.extraBold,
                            fontSize: 20.sp,
                          ),
                    ),
                    TextUtiels(
                      text: ' ${items[index].amount.toString()}',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: AppFontFamily.extraBold,
                            fontSize: 20.sp,
                          ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextUtiels(
                    text: AppSharedPreferences.getName(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 15.sp,
                          color: AppColorManger.textGray,
                        ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextUtiels(
                    text: DateFormat.jm()
                        .add_yMd()
                        .format(items[index].creationTime ?? DateTime.now()),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 10.sp,
                          color: AppColorManger.colorShowDailogButton,
                        ),
                  ),
                ],
              ),
              SizedBox(
                width: 13.w,
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
