import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/features/auth/presentation/widget/bottom_sheet_reset_password.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage(
      {super.key, required this.phoneNumber, required this.code});
  final String phoneNumber;
  final String code;
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
      bottomSheet: BottomeSheetResetPasswordWidget(
        code: code,
        phoneNumber: phoneNumber,
      ),
    );
  }
}
