import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/core/widget/repeted/shimmer_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/caption_text_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/info_doctor_widget.dart';
import 'package:http/http.dart';

class DoctorInfoError extends StatelessWidget {
  const DoctorInfoError(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipPath(
          clipper: ClippingClass(),
          child: Container(
            width: double.infinity,
            height: 250.h,
            decoration: BoxDecoration(
              color: AppColorManger.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //? api this text not static :

                      SizedBox(
                        height: 9.h,
                      ),
                      // ? api this text not static :

                      SizedBox(height: 9.h),
                      //? api this text not static :
                      const InfoDoctor(
                        icon: AppSvgManger.iconPhone,
                        text: '',
                      ),
                      SizedBox(height: 8.h),
                      const InfoDoctor(
                        icon: AppSvgManger.iconLocation,
                        text: '',
                      ),
                    ],
                  ),
                ),
                const ShimmerWidget(
                  height: 200,
                  width: 200,
                  color: Color.fromARGB(255, 15, 126, 206),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15.h),
        const CaptionTextWidget(
          text: AppWordManger.aboutDoctor,
        ),
        ErrorTextWidget(text: text, onPressed: onPressed)
      ],
    );
  }
}
