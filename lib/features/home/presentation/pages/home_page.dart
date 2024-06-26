import 'package:double_back_to_exit/non_web_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import '../../../../core/class/clipping_path_class.dart';
import '../../../../core/function/navigation_funcation.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/enum_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/text_utiles/error_text.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../cubit/adv/adv_cubit.dart';
import '../cubit/services/services_cubit.dart';
import '../widgets/home_primary/caption_text_widget.dart';
import '../widgets/home_primary/info_doctor_widget.dart';
import '../widgets/home_primary/info_services_widget.dart';
import '../widgets/home_primary/info_tipa_news_widget.dart';
import '../widgets/home_primary/reservation_now_button_widget.dart';
import 'package:stroke_text/stroke_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DoubleBackToExitWidget(
      backgroundColor: AppColorManger.primaryColor,
      behavior: SnackBarBehavior.floating,
      width: 280.w,
      padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
      snackBarMessage: AppWordManger.preesAnotherForExit,
      textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
          ),
      child: MainBackGround(
        mainBody: SingleChildScrollView(
          child: Column(
            children: [
              //?api :
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
                            StrokeText(
                              text: "د. علي محمد",
                              textStyle: TextStyle(
                                fontSize: AppFontSizeManger.s24,
                                fontFamily: AppFontFamily.extraBold,
                                color: AppColorManger.white,
                              ),
                              strokeColor: AppColorManger.secoundryColor,
                              strokeWidth: 4.2,
                              textColor: AppColorManger.white,
                            ),
                            //? api this text not static :
                            TextUtiels(
                              text: 'اخصائي في الجراحة التجميلية',
                              fontFamily: AppFontFamily.tajawalRegular,
                              color: AppColorManger.offWhite,
                              fontSize: AppFontSizeManger.s12,
                            ),
                            SizedBox(height: 9.h),
                            //? api this text not static :
                            const InfoDoctor(
                              icon: AppSvgManger.iconPhone,
                              text: '0935059787',
                            ),
                            SizedBox(height: 8.h),
                            const InfoDoctor(
                              icon: AppSvgManger.iconLocation,
                              text: 'دمشق _المزة',
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        width: 200,
                        height: 200,
                        'assets/image/png/backgroundDoctor.png',
                      )
                    ],
                  ),
                ),
              ),

              //? button reservation Now :
              GestureDetector(
                onTap: () {
                  isGuestOrUserForReservation(context);
                },
                child: const ReservationNowButtonWidget(
                  text: AppWordManger.reservationNow,
                ),
              ),
              SizedBox(height: 15.h),
              //? about doctor label :
              const CaptionTextWidget(
                text: AppWordManger.aboutDoctor,
              ),
              SizedBox(height: 18.h),
              //? about doctor text <Api>:
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
              SizedBox(height: 18.h),
              //? Services :
              const CaptionTextWidget(
                text: AppWordManger.services,
              ),
              //? api this is :
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: BlocBuilder<ServicesCubit, ServicesState>(
                  builder: (context, state) {
                    if (state.status == DeafultBlocStatus.done) {
                      return InfoServicesWidget(
                        items: state.services,
                      );
                    } else if (state.status == DeafultBlocStatus.loading) {
                      return MainLoadignWidget(
                        height: 160.h,
                      );
                    } else {
                      return ErrorText(
                        text: state.failureMessage.message,
                        height: 160.h,
                      );
                    }
                  },
                ),
              ),
              //?
              const CaptionTextWidget(
                text: AppWordManger.tipsAndNews,
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: BlocBuilder<AdvCubit, AdvState>(
                  builder: (context, state) {
                    if (state.status == DeafultBlocStatus.done) {
                      return InfoTipasNewsWidget(
                        advs: state.advs,
                      );
                    } else if (state.status == DeafultBlocStatus.loading) {
                      return MainLoadignWidget(
                        height: 170.h,
                      );
                    } else {
                      return ErrorText(
                        text: state.failureMessage.message,
                        height: 170.h,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 60.h)
            ],
          ),
        ),
      ),
    );
  }
}
