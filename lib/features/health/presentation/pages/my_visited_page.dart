import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/titel_pages_widget.dart';
import '../widgets/my_visits/info_my_visit.dart';

class MyVistsPage extends StatelessWidget {
  const MyVistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Column(
        children: [
          TitlePageWidget(
            titleText: AppWordManger.myVisited,
            onTap: () => Navigator.pop(context),
          ),
          Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SvgPicture.asset(
                    width: 75.w,
                    height: 75.h,
                    AppSvgManger.iconMyVisit,
                  ),
                ),
                //? Info My Visit :
                const InfoMyVisit()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
