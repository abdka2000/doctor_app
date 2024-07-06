// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/item.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/filed_decription_medical.dart';

class MidicalTableBody extends StatelessWidget {
  const MidicalTableBody({
    super.key,
    required this.items,
    required this.hasReachedMax,
    required this.controller,
  });
  final List<Item> items;
  final bool hasReachedMax;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319.w,
      height: 300.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorManger.secoundryColor,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VerticalDivider(
                  color: AppColorManger.lineDividerColor.withOpacity(0.74),
                  thickness: 2.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: VerticalDivider(
                    color: AppColorManger.lineDividerColor.withOpacity(0.74),
                    thickness: 2.w,
                  ),
                ),
                VerticalDivider(
                  color: AppColorManger.lineDividerColor.withOpacity(0.74),
                  thickness: 2.w,
                ),
              ],
            ),
          ),
          Column(
            children: [
              const FiledDescriptionMedical(
                nameMedicine: AppWordManger.nameMedicine,
                timeOfUse: AppWordManger.timeOfUse,
                periodOfUse: AppWordManger.periodOfUse,
                showText: true,
              ),
              //? Elemant Datat :
              Expanded(
                child: ListView.separated(
                  controller: controller,
                  itemCount: items.length + 1,
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    if (index == items.length && !hasReachedMax) {
                      return const MainLoadignWidget();
                    } else if (index == items.length && hasReachedMax)
                      return null;
                    else
                      return Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColorManger.secoundryColor,
                            width: 1.2.w,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 82.w,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: TextUtiels(
                                    paddingLeft: 10.w,
                                    text: items[index].medicineName ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                ),
                              ),
                              TextUtiels(
                                text: " أيام ${items[index].usageDuration} ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 10.sp,
                                    ),
                              ),
                              items[index].isBeforeFood ?? false
                                  ? Container(
                                      margin: EdgeInsets.only(right: 20.w),
                                      width: 25.w,
                                      height: 5.h,
                                      color: AppColorManger.secoundryColor,
                                    )
                                  : Container(),
                              // TextUtiels(
                              //   text: items[index].isBeforeFood ?? false
                              //       ? 'نعم'
                              //       : 'لا',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .bodySmall
                              //       ?.copyWith(
                              //         fontSize: 10.sp,
                              //       ),

                              TextUtiels(
                                text: items[index].usageTimes.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 10.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
