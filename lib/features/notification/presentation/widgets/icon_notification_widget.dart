import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/svg_manger.dart';

class IconNotificationWidget extends StatelessWidget {
  const IconNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: AppColorManger.secoundryColor,
        child: SizedBox(
          width: 34.w,
          height: 34.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            child: SvgPicture.asset(
              colorFilter:
                  ColorFilter.mode(AppColorManger.white, BlendMode.srcIn),
              AppSvgManger.iconHeart,
            ),
          ),
        ),
      ),
    );
  }
}
