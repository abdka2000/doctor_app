import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:intl/intl.dart';

class VisitItem extends StatelessWidget {
  const VisitItem({
    super.key, required this.session,
  });
  final MidicalSession session;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.w,
        height: 145.h,
        decoration: BoxDecoration(
          color: AppColorManger.fillColorCard,
          border: Border.all(
            color: AppColorManger.primaryColor,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SvgPicture.asset(
              width: 75.w,
              height: 75.h,
              AppSvgManger.iconMyVisit,
            ),
          ),
          // //? Info My Visit :
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextUtiels(
                paddingLeft: 50.w,
                paddingBottome: 10.h,
                paddingTop: 20.h,
                text: 'الزيارة ${(session.id)! + 1}',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
              //? Day :
              Row(
                children: [
                  //? Text for All Date
                  TextUtiels(
                    paddingRight: 7.w,
                    text:
                        DateFormat('yyyy/MM/dd').format(session.creationTime!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                        ),
                  ),
                  SizedBox(width: 20.w),
                  //? Text For Only Day
                  TextUtiels(
                    text: DateFormat.EEEE('ar').format(session.creationTime!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                        ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
              //? hour :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // TextUtiels(
                  //   text: DateFormat.jm('ar').format(session.creationTime!),
                  //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  //         fontSize: 11.sp,
                  //       ),
                  // ),
                  //? Text For Time
                  TextUtiels(
                    text: DateFormat('jm').format(session.creationTime!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                        ),
                  ),
                  SizedBox(width: 29.w),
                  TextUtiels(
                    text: ':الساعة',
                    paddingRight: 8.w,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                        ),
                  ),
                ],
              ),
            ],
          )
        ]));
  }
}
