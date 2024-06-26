import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/svg_manger.dart';
import '../main/nav_button_main/cubit/button_nav_cubit.dart';
import '../text_utiles/text_utile_widget.dart';
import '../../../router/app_router.dart';

class TitlePageWidget extends StatelessWidget {
  const TitlePageWidget(
      {super.key, required this.titleText, this.onTap, this.paddingBottome});
  final String titleText;
  final void Function()? onTap;
  final double? paddingBottome;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.w,
        right: 14.w,
        top: 56.h,
        bottom: paddingBottome ?? 56.h,
      ),
      //? Arrow And Text :
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap ??
                () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNamedScreens.homeScreenNameRoute,
                  );
                  context
                      .read<ButtonNavCubit>()
                      .changeIndexButtonNav(2, context);
                },
            child: SvgPicture.asset(
              AppSvgManger.iconArrow,
              width: 30.w,
              height: 30.h,
            ),
          ),
          TextUtiels(
            paddingRight: 16.w,
            text: titleText,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 20.sp,
                ),
          ),
        ],
      ),
    );
  }
}
