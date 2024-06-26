import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class EmptyMyFileWidget extends StatelessWidget {
  const EmptyMyFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.h),
      child: Column(
        children: [
          SvgPicture.asset(
            width: 127,
            height: 127.h,
            AppSvgManger.emptyIconFile,
          ),
          TextUtiels(
            paddingTop: 20.h,
            text: AppWordManger.notFoundFile,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 24.sp,
                ),
          ),
          TextUtiels(
            paddingTop: 16.h,
            text: AppWordManger.documentsSentSecurelyFrom,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
          TextUtiels(
            text: AppWordManger.byYourServiceOrSupportProvider,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}
