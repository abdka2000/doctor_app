// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import '../../../../core/function/validation_funcation.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/enum_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/loading/main_loading.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../../core/widget/form_filed/text_form_filed_pasword_widget.dart';
import '../logic/auth_logic.dart';

class BottomeSheetResetPasswordWidget extends StatelessWidget {
  const BottomeSheetResetPasswordWidget(
      {super.key, required this.phoneNumber, required this.code});
  final String phoneNumber;
  final String code;
  @override
  Widget build(BuildContext context) {
    String password1 = '';
    String password2 = '';
    bool enabled = true;
    final GlobalKey<FormState> formKeyLogin = GlobalKey();
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColorManger.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 19.w,
          ),
          child: Form(
            key: formKeyLogin,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 28.h,
                  ),
                  child: SvgPicture.asset(
                    width: 20.w,
                    height: 4.h,
                    AppSvgManger.rowBottomeSheet,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.zero,
                        // padding: EdgeInsetsDirectional.only(start: 14.w),
                        child: SvgPicture.asset(
                          width: 30.w,
                          height: 30.h,
                          AppSvgManger.iconArrow,
                        ),
                      ),
                    ),
                    TextUtiels(
                      text: AppWordManger.resetPassword,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: AppFontSizeManger.s24,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 29.h,
                ),
                //? filed first pass :
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: TextFormFiledPassword(
                    hintText: AppWordManger.newPassword,
                    onChange: (value) {
                      password1 = value;
                    },
                    validator: (value) =>
                        VilidationApp().validatorPassword(value!, context),
                    textInputType: TextInputType.visiblePassword,
                    filedWidth: 275,
                    filedHeight: 60,
                  ),
                ),
                //? filed new pass :
                Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                    left: 25.w,
                    top: 20.h,
                  ),
                  child: TextFormFiledPassword(
                    hintText: AppWordManger.confirmNewPassword,
                    onChange: (value) {
                      password2 = value;
                    },
                    validator: (value) =>
                        VilidationApp().validateForConfirmPassword(
                      value!,
                      password1,
                    ),
                    textInputType: TextInputType.visiblePassword,
                    filedWidth: 275,
                    filedHeight: 60,
                  ),
                ),
                SizedBox(height: 24.h),

                //? button for login :
                BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    AuthLogic()
                        .listenerResetPassword(state, context, phoneNumber);
                  },
                  builder: (context, state) {
                    if (state.status == DeafultBlocStatus.loading) {
                      enabled = false;
                      return const MainLoadignWidget();
                    }
                    enabled = true;
                    return MainElevatedButton(
                      raduiseBorder: 13.r,
                      text: AppWordManger.sure,
                      backgroundColor: AppColorManger.primaryColor,
                      textColor: AppColorManger.white,
                      horizontalPadding: 120.w,
                      onPreesed: () {
                        if (formKeyLogin.currentState!.validate()) {
                          context.read<ForgetPasswordCubit>().resetPasswrd(
                              phoneNumber: phoneNumber,
                              code: code,
                              password: password1);
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 27.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
