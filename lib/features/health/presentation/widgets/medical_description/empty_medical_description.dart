import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class EmptyMedicalDesciption extends StatelessWidget {
  const EmptyMedicalDesciption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.h),
      child: Column(
        children: [
          SvgPicture.asset(
            width: 127,
            height: 127.h,
            AppSvgManger.emptyIconDesciptionMedical,
          ),
          TextUtiels(
            paddingTop: 40.h,
            text: AppWordManger.dontAnyDescriptionMedcal,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 24.sp,
                ),
          )
        ],
      ),
    );
  }
}
