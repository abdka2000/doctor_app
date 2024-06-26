// ignore_for_file: deprecated_member_use
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_state.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/helper/function_nave.dart';

class MainButtonNavigation extends StatelessWidget {
  const MainButtonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonNavCubit, ButtonNavBarState>(
      builder: (context, state) {
        int selectedIndex = state.buttonNavBarIndex;
        //? function for padding word

        return CurvedNavigationBar(
          index: state.buttonNavBarIndex,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: AppColorManger.primaryColor,
          color: AppColorManger.grayNavButton,
          iconPadding: 13.w,
          height: 70.h,
          items: [
            CurvedNavigationBarItem(
              //? health Tap :
              child: Padding(
                padding: paddingWordUnSelected(
                  index: 0,
                  selectedIndex: selectedIndex,
                ),
                child: SvgPicture.asset(
                  AppSvgManger.iconHeart,
                  width: 25.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    changeColorIconFun(
                      index: 0,
                      selectedIndex: selectedIndex,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: removeLabelIconFun(
                index: 0,
                selectedIndex: selectedIndex,
                labelWord: AppWordManger.health,
              ),
              labelStyle: TextStyle(
                fontFamily: AppFontFamily.tajawalRegular,
                color: AppColorManger.primaryColor,
                fontSize: AppFontSizeManger.s9,
              ),
            ), //?
            //? notification Tap :
            CurvedNavigationBarItem(
              child: Padding(
                padding: paddingWordUnSelected(
                    index: 1, selectedIndex: selectedIndex),
                child: SvgPicture.asset(
                  AppSvgManger.iconNotification,
                  width: 25.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    changeColorIconFun(index: 1, selectedIndex: selectedIndex),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: removeLabelIconFun(
                index: 1,
                selectedIndex: selectedIndex,
                labelWord: AppWordManger.notification,
              ),
              labelStyle: TextStyle(
                fontFamily: AppFontFamily.tajawalRegular,
                color: AppColorManger.primaryColor,
                fontSize: AppFontSizeManger.s9,
              ),
            ), //?
            //? Home Tap
            CurvedNavigationBarItem(
              child: Padding(
                padding: paddingWordUnSelected(
                    index: 2, selectedIndex: selectedIndex),
                child: SvgPicture.asset(
                  AppSvgManger.iconHome,
                  width: 25.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    changeColorIconFun(index: 2, selectedIndex: selectedIndex),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: removeLabelIconFun(
                index: 2,
                selectedIndex: selectedIndex,
                labelWord: AppWordManger.home,
              ),
              labelStyle: TextStyle(
                fontFamily: AppFontFamily.tajawalRegular,
                color: AppColorManger.primaryColor,
                fontSize: AppFontSizeManger.s9,
              ),
            ), //?
            //? Reservation Tap :
            CurvedNavigationBarItem(
              child: Padding(
                padding: paddingWordUnSelected(
                    index: 3, selectedIndex: selectedIndex),
                child: SvgPicture.asset(
                  AppSvgManger.iconReserviation,
                  width: 25.w,
                  height: 25.h,
                ),
              ),
              label: removeLabelIconFun(
                index: 3,
                selectedIndex: selectedIndex,
                labelWord: AppWordManger.reservition,
              ),
              labelStyle: TextStyle(
                fontFamily: AppFontFamily.tajawalRegular,
                color: AppColorManger.primaryColor,
                fontSize: AppFontSizeManger.s9,
              ),
            ), //?

            //? profile Tap :
            CurvedNavigationBarItem(
              child: Padding(
                padding: paddingWordUnSelected(
                    index: 4, selectedIndex: selectedIndex),
                child: SvgPicture.asset(
                  AppSvgManger.iconProfile,
                  width: 25.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    changeColorIconFun(index: 4, selectedIndex: selectedIndex),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: removeLabelIconFun(
                index: 4,
                selectedIndex: selectedIndex,
                labelWord: AppWordManger.profile,
              ),
              labelStyle: TextStyle(
                fontFamily: AppFontFamily.tajawalRegular,
                color: AppColorManger.primaryColor,
                fontSize: AppFontSizeManger.s9,
              ),
            ),
          ],
          onTap: (index) {
            if (index != selectedIndex) {
              selectedIndex = index;
              context.read<ButtonNavCubit>().changeIndexButtonNav(
                    selectedIndex,
                    context,
                  );
            }
          },
        );
      },
    );
  }
}
