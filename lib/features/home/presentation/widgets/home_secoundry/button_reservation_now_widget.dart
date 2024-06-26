import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../../../router/app_router.dart';

class ButtonReservationNow extends StatelessWidget {
  const ButtonReservationNow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNamedScreens.reservationDetailsNameRoute,
        );
      },
      child: Container(
        width: 130.w,
        height: 45.h,
        margin: EdgeInsets.only(top: 19.h),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: AppColorManger.primaryColor.withOpacity(0.98),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
        child: TextUtiels(
          text: AppWordManger.reservationNow,
          fontFamily: AppFontFamily.extraBold,
          color: AppColorManger.white,
          fontSize: AppFontSizeManger.s18,
        ),
      ),
    );
  }
}
