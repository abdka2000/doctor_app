import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoDoctorDoctor extends StatelessWidget {
  const InfoDoctorDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.h,
      child: Column(
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              color: AppColorManger.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColorManger.white,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColorManger.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Image.asset(
                'assets/image/png/backgroundDoctor.png',
              ),
            ),
          ),
          TextUtiels(
            text: 'د. علي محمد',
            paddingTop: 5.h,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 22.sp,
                ),
          ),
          TextUtiels(
            text: 'اخصائي في الجراحة التجميلية',
            paddingTop: 5.h,
            paddingBottome: 70.h,
            style: TextStyle(
              fontFamily: AppFontFamily.tajawalRegular,
              color: AppColorManger.backGroundColorShowDialog,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
