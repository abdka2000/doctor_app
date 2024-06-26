import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/png_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../widget/bottome_sheet_verification_widget.dart';

class ConfirmFrogetPassword extends StatelessWidget {
  const ConfirmFrogetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPngManger.backGroundLoginPage),
          ),
        ),
      ),
      bottomSheet: BottomeSheetVerifivcationWidget(
        numberPhone:
            AppWordManger.useTheCodeSentToYouToVerifyAndAccessYourAccount,
        fontColorSubText: AppColorManger.textColor2,
        fontFamailySubText: AppFontFamily.tajawalRegular,
        fontSizeSubText: 12.sp,
      ),
    );
  }
}
