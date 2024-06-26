import 'package:flutter/material.dart';
import '../../../../core/resources/png_manger.dart';
import '../widget/bottome_sheet_signup_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            image: AssetImage(
              AppPngManger.backGroundSignUpPage,
            ),
          ),
        ),
      ),
      bottomSheet: const BottomeSheetSignUpWidget(),
    );
  }
}
