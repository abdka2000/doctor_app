import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../widgets/medical_description/filed_decription_medical.dart';

class MedicalDescriptionTablePage extends StatelessWidget {
  const MedicalDescriptionTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Column(
        children: [
          TitlePageWidget(
            titleText: AppWordManger.medicalDescraption,
            onTap: () => Navigator.pop(context),
            paddingBottome: 40.h,
          ),
          Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 74.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VerticalDivider(
                        color:
                            AppColorManger.lineDividerColor.withOpacity(0.74),
                        thickness: 2.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: VerticalDivider(
                          color:
                              AppColorManger.lineDividerColor.withOpacity(0.74),
                          thickness: 2.w,
                        ),
                      ),
                      VerticalDivider(
                        color:
                            AppColorManger.lineDividerColor.withOpacity(0.74),
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
                        itemCount: 5,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemBuilder: (context, index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextUtiels(
                                    paddingLeft: 10.w,
                                    text: 'setamol',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  TextUtiels(
                                    text: 'ابام 10',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 10.sp,
                                        ),
                                  ),
                                  Container(
                                    width: 25.w,
                                    height: 5.h,
                                    color: AppColorManger.secoundryColor,
                                  ),
                                  TextUtiels(
                                    text: '3',
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
          ),
        ],
      ),
    );
  }
}
