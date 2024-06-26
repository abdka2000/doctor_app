import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/svg_manger.dart';

class GoLoginImageWidget extends StatelessWidget {
  const GoLoginImageWidget({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: SvgPicture.asset(
                width: 100.w,
                height: 100.h,
                AppSvgManger.circalInside,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: SvgPicture.asset(
                width: 110.w,
                height: 110.h,
                AppSvgManger.circalOutSide,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
