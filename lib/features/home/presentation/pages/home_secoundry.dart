import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/class/clipping_path_class.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../widgets/home_primary/caption_text_widget.dart';
import '../widgets/home_primary/info_tipa_news_widget.dart';
import '../widgets/home_secoundry/button_reservation_now_widget.dart';
import '../widgets/home_secoundry/card_luncher.dart';
import '../widgets/home_secoundry/info_doctor_widget.dart';

class HomeSecoundryPage extends StatelessWidget {
  const HomeSecoundryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipPath(
                      clipper: ClippingClass(),
                      child: Container(
                        width: double.infinity,
                        height: 140.h,
                        decoration: BoxDecoration(
                          color: AppColorManger.primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 25.h,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 14.h),
                            child: const CardLuncherWidget(
                              icon: AppSvgManger.iconPhone,
                              text: '0935059787',
                            ),
                          ),
                          const CardLuncherWidget(
                            icon: AppSvgManger.iconLocation,
                            text: 'دمشق _المزة',
                          ),
                          //? Button Reservatin Now :
                          const ButtonReservationNow(),
                        ],
                      ),
                    ),
                  ],
                ),
                //? Part Image :
                const InfoDoctorDoctor(),
              ],
            ),
            //? About Doctor :
            Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: const CaptionTextWidget(
                text: AppWordManger.aboutDoctor,
              ),
            ),
            //? Demo Text :
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
              child: TextUtiels(
                text: AppWordManger.textVisible,
                fontFamily: AppFontFamily.tajawalRegular,
                color: AppColorManger.textColor1,
                fontSize: AppFontSizeManger.s13,
                height: 1.5.h,
              ),
            ),
            //? tipsAndNews Text :
            const CaptionTextWidget(
              text: AppWordManger.tipsAndNews,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: const InfoTipasNewsWidget(
                advs: [],
              ),
            ),
            SizedBox(height: 60.h)
          ],
        ),
      ),
    );
  }
}
