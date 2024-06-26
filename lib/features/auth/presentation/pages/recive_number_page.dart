import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/png_manger.dart';
import '../widget/bottome_sheet_verification_widget.dart';

class ReciveNumberVerificationPage extends StatelessWidget {
  const ReciveNumberVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPngManger.backGroundSignUpPage),
          ),
        ),
      ),
      bottomSheet: BottomeSheetVerifivcationWidget(
        numberPhone: '0982097872',
        fontColorSubText: AppColorManger.black,
        fontFamailySubText: AppFontFamily.tajawalBold,
        fontSizeSubText: 16.sp,
      ),
    );
  }
}
