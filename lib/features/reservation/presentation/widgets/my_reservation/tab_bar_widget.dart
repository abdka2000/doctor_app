import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/word_manger.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          color: AppColorManger.fillColorCard,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: TabBar(
          automaticIndicatorColorAdjustment: true,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColorManger.colorShowDailogButton,
          labelColor: AppColorManger.primaryColor,
          indicatorColor: AppColorManger.white,
          indicatorWeight: 2,
          indicator: BoxDecoration(
            color: AppColorManger.colorButtonShowDailog,
            borderRadius: BorderRadius.circular(5.r),
          ),
          labelStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 16.sp,
              ),
          tabs: const [
            Tab(text: AppWordManger.finshied),
            Tab(text: AppWordManger.watting),
          ],
        ),
      ),
    );
  }
}
