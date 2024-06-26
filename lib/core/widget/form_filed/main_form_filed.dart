import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../function/outline_input_border_function.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';

class MainTextFormFiled extends StatelessWidget {
  const MainTextFormFiled({
    super.key,
    this.hintText,
    required this.onChange,
    required this.textInputType,
    this.filedWidth,
    this.filedHeight,
    this.validator,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.onPressed,
    this.onPressedSuffixIcon,
    this.fillColor,
    this.borderColor,
    this.borderWidht,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.obscureText,
    this.readOnly,
    this.suffixIcon,
    this.controller,
    this.hintTextColor,
    this.fontSize, required this.enabled,
  });
  final bool enabled;
  final String? hintText;
  final TextInputType textInputType;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final double? filedWidth;
  final double? filedHeight;
  final void Function()? onPressedSuffixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidht;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final bool? obscureText;
  final bool? readOnly;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final Color? hintTextColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: filedHeight,
        width: filedWidth,
        child: TextFormField(
          enabled: enabled,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16.sp,
                color: AppColorManger.black,
              ),
          controller: controller,
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          textDirection: TextDirection.rtl,
          textInputAction: TextInputAction.next,
          inputFormatters: inputFormatter,
          keyboardType: textInputType,

          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? AppColorManger.fillColor,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: contentPaddingHorizontal ?? 12.w,
              vertical: contentPaddingVertical ?? 12.h,
            ),
            suffixIcon: IconButton(
              onPressed: onPressedSuffixIcon,
              icon: Icon(
                suffixIcon,
                color: AppColorManger.primaryColor,
              ),
            ),
            hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontFamily: AppFontFamily.tajawalRegular,
                  fontSize: fontSize ?? 13.sp,
                  fontWeight: AppFontWeightManger.fontWeightSemiBold,
                  color: hintTextColor,
                ),
            errorStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontFamily: AppFontFamily.tajawalRegular,
                  fontSize: fontSize ?? 12.sp,
                  fontWeight: AppFontWeightManger.fontWeightSemiBold,
                  color: AppColorManger.primaryColor,
                  height: 1,
                ),
            //? border :
            enabledBorder: outlineInputBorder(
              circular: 13.r,
              width: borderWidht ?? 0,
              color: borderColor ?? Colors.transparent,
            ),
            focusedBorder: outlineInputBorder(
              circular: 13,
              width: borderWidht ?? 0,
              color: borderColor ?? Colors.transparent,
            ),
            errorBorder: outlineInputBorder(
              circular: 13,
              width: borderWidht ?? 0,
              color: Colors.transparent,
            ),
            focusedErrorBorder: outlineInputBorder(
              circular: 13,
              width: borderWidht ?? 0,
              color: Colors.transparent,
            ),
          ),
          //? Function Event :
          onChanged: onChange,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
        ),
      ),
    );
  }
}
