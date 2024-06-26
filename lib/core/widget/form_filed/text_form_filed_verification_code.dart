import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFiledWidget extends StatelessWidget {
  const PinCodeFiledWidget({
    super.key,
    this.onChange,
    this.onCompleted,
  });
  final Function(String)? onChange;
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        obscureText: false,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        animationType: AnimationType.fade,
        textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: AppFontWeightManger.fontWeightBold,
              fontSize: 24.sp,
            ),
        pinTheme: PinTheme(
          activeFillColor: AppColorManger.black,
          fieldWidth: 47.83.w,
          inactiveColor: AppColorManger.pinColorFiled,
          selectedColor: AppColorManger.primaryColor,
          activeColor: AppColorManger.primaryColor,
          shape: PinCodeFieldShape.underline,
        ),
        animationDuration: const Duration(milliseconds: 300),
        onChanged: onChange,
        onCompleted: onCompleted,
      ),
    );
  }
}
