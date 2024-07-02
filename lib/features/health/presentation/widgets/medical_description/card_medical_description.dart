import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../../../router/app_router.dart';

class CardMedicalDescription extends StatelessWidget {
  const CardMedicalDescription({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNamedScreens.midicalDesciptionTableNameRoute,
          arguments: id,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: Container(
          width: 318.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColorManger.fillColorCard,
            border: Border.all(
              color: AppColorManger.primaryColor,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: SvgPicture.asset(
                  width: 10.w,
                  height: 22.h,
                  AppSvgManger.iconArrowProfile,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtiels(
                    paddingRight: 16.w,
                    text: 'وصفة طبية ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                  Row(
                    children: [
                      TextUtiels(
                        paddingRight: 16.w,
                        text: '2:15م',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 11.sp,
                                ),
                      ),
                      TextUtiels(
                        paddingRight: 16.w,
                        text: '2023/8/25',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 11.sp,
                                ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
