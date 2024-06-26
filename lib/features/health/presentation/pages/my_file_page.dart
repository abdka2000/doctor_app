import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/titel_pages_widget.dart';
import '../widgets/my_files/info_my_file.dart';

class MyFilePage extends StatelessWidget {
  const MyFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Column(
        children: [
          TitlePageWidget(
            titleText: AppWordManger.myFiles,
            onTap: () => Navigator.pop(context),
          ),
          //? Info List My File :
          Expanded(
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              itemBuilder: (context, index) {
                return Container(
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
                  child: const InfoMyFileWidget(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
