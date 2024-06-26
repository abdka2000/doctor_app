import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class CardLuncherWidget extends StatelessWidget {
  const CardLuncherWidget({super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(22.r),
        ),
        gradient: LinearGradient(
          end: const Alignment(-0.011, -3.8),
          begin: const Alignment(0.078, 2),
          colors: [
            AppColorManger.colorLinear,
            AppColorManger.white.withOpacity(0)
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Row(
        children: [
          TextUtiels(
            paddingTop: 5.h,
            paddingRight: 10.w,
            text: text,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 12.5.sp,
                ),
          ),
          SvgPicture.asset(
            width: 15.spMin,
            height: 15.spMin,
            icon,
          ),
        ],
      ),
    );
  }
}
