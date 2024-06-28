import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../function/outline_input_border_function.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';

class TextFormFiledPassword extends StatefulWidget {
  const TextFormFiledPassword({
    Key? key,
    required this.hintText,
    required this.onChange,
    required this.textInputType,
    this.validator,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.onPressed,
    this.filedWidth,
    this.filedHeight,
    this.onPressedSuffixIcon,
    this.fillColor,
    this.filled,
    this.contenetPaddingvertical,
    this.borderWidht,
    this.borderColor,
    this.contentPaddingHorizontal,
    this.suffixIconColor,
    this.colorHintText,
    this.fontSizeHintText,
    this.fontWeightHintText,
    required this.enabled,
  }) : super(key: key);
  final bool enabled;
  final String hintText;
  final TextInputType textInputType;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final double? filedWidth;
  final double? filedHeight;
  final bool? filled;
  final Color? fillColor;
  final void Function()? onPressedSuffixIcon;
  final double? contenetPaddingvertical;
  final double? contentPaddingHorizontal;
  final double? borderWidht;
  final Color? borderColor;
  final Color? suffixIconColor;
  final Color? colorHintText;
  final double? fontSizeHintText;
  final FontWeight? fontWeightHintText;
  @override
  State<TextFormFiledPassword> createState() => _TextFormFiledPasswordState();
}

class _TextFormFiledPasswordState extends State<TextFormFiledPassword> {
  bool showPassword = false;
  bool showIconFiled = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        enabled: widget.enabled,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              color: AppColorManger.black,
            ),
        obscureText: !showPassword,
        textDirection: TextDirection.rtl,
        textInputAction: TextInputAction.next,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: widget.suffixIconColor ?? AppColorManger.primaryColor,
              ),
            ),
          ),
          filled: widget.filled ?? true,
          fillColor: widget.fillColor ?? AppColorManger.fillColor,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.contentPaddingHorizontal ?? 27.w,
            vertical: widget.contenetPaddingvertical ?? 13.h,
          ),
          hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontFamily: AppFontFamily.tajawalRegular,
                fontSize: widget.fontSizeHintText ?? 13.sp,
                fontWeight: widget.fontWeightHintText ??
                    AppFontWeightManger.fontWeightSemiBold,
                color: widget.colorHintText ?? AppColorManger.black,
              ),
          errorStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontFamily: AppFontFamily.tajawalRegular,
                fontSize: 12.sp,
                fontWeight: AppFontWeightManger.fontWeightSemiBold,
                color: AppColorManger.primaryColor,
                height: 1,
              ),
          //? Border :
          enabledBorder: outlineInputBorder(
            circular: 13.r,
            width: widget.borderWidht ?? 0,
            color: widget.borderColor ?? Colors.transparent,
          ),
          focusedBorder: outlineInputBorder(
            width: widget.borderWidht ?? 0,
            color: widget.borderColor ?? Colors.transparent,
            circular: 13.r,
          ),
          errorBorder: outlineInputBorder(
            circular: 13,
            width: widget.borderWidht ?? 0,
            color: Colors.transparent,
          ),
          focusedErrorBorder: outlineInputBorder(
            circular: 13,
            width: widget.borderWidht ?? 0,
            color: Colors.transparent,
          ),
        ),
        onChanged: widget.onChange,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
      ),
    );
  }
}
