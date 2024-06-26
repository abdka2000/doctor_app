import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoMyFileWidget extends StatelessWidget {
  const InfoMyFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //? Dowanload Icon :
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: SvgPicture.asset(
            width: 41.w,
            height: 41.h,
            AppSvgManger.iconDowanload,
          ),
        ),
        //? Ifno File :
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtiels(
                text: 'تصوير شعاعي',
                paddingBottome: 3.h,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(
                width: 120.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtiels(
                        text: '2:15',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 10.sp,
                                ),
                      ),
                      TextUtiels(
                        text: '2023/8/25',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 10.sp,
                                ),
                      ),
                      TextUtiels(
                        text: '12.35 kB',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 10.sp,
                                ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //? Icon File Or Image :
        SvgPicture.asset(
          width: 70.w,
          height: 70.h,
          AppSvgManger.iconFile,
        ),
      ],
    );
  }
}
