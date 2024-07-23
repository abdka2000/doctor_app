import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/function/navigation_funcation.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/caption_text_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/info_doctor_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/reservation_now_button_widget.dart';
import 'package:stroke_text/stroke_text.dart';

class HomePageDoctorInfo extends StatelessWidget {
  const HomePageDoctorInfo({super.key, required this.doctorInfo});
  final DoctorInfoEntity doctorInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: ClippingClass(),
          child: Container(
            width: double.infinity,
            height: 250.h,
            decoration: BoxDecoration(
              color: AppColorManger.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'http://${doctorInfo.result?.personalImageUrl ?? ''}',
                ),
              ),
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
                        text: (doctorInfo.result?.doctorName == null ||
                                (doctorInfo.result?.doctorName?.isEmpty ??
                                    true))
                            ? "Doctor Name"
                            : doctorInfo.result!.doctorName!,
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
                        text: (doctorInfo.result?.specialization == null ||
                                (doctorInfo.result?.specialization?.isEmpty ??
                                    true))
                            ? 'Doctor Specialization'
                            : doctorInfo.result!.specialization!,
                        fontFamily: AppFontFamily.tajawalRegular,
                        color: AppColorManger.offWhite,
                        fontSize: AppFontSizeManger.s12,
                      ),
                      SizedBox(height: 9.h),
                      //? api this text not static :
                      InfoDoctor(
                        icon: AppSvgManger.iconPhone,
                        text: (doctorInfo.result?.phoneNumber == null ||
                                (doctorInfo.result?.phoneNumber?.isEmpty ??
                                    true))
                            ? '0000000000'
                            : doctorInfo.result?.phoneNumber,
                      ),
                      SizedBox(height: 8.h),
                      InfoDoctor(
                        icon: AppSvgManger.iconLocation,
                        text: (doctorInfo.result?.address == null ||
                                (doctorInfo.result?.address?.isEmpty ?? true))
                            ? 'address'
                            : doctorInfo.result!.address!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 170,
                  height: 200,
                ),
                // CachedNetworkImage(
                //   imageUrl:
                //       'http://${doctorInfo.result?.personalImageUrl ?? ''}',
                //   width: 200,
                //   height: 200,
                //   errorWidget: (context, url, error) => Icon(
                //     Icons.error_outline,
                //     color: AppColorManger.colorButtonShowDailog,
                //   ),
                // )
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
            text: (doctorInfo.result?.introduction == null ||
                    (doctorInfo.result?.introduction?.isEmpty ?? true))
                ? "لا يوجد نص حالياً"
                : doctorInfo.result!.introduction!,
            fontFamily: AppFontFamily.tajawalRegular,
            color: AppColorManger.textColor1,
            fontSize: AppFontSizeManger.s13,
            height: 1.5.h,
          ),
        ),
      ],
    );
  }
}
