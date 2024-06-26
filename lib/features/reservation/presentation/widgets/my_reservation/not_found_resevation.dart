import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class NotFoundReservationWidget extends StatelessWidget {
  const NotFoundReservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 40.h,
          ),
          child: SvgPicture.asset(
            AppSvgManger.iconReservation,
            width: 120.w,
            height: 125.h,
          ),
        ),
        TextUtiels(
          text: AppWordManger.notFoundResevationinThisYet,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 24.sp,
              ),
        )
      ],
    );
  }
}
