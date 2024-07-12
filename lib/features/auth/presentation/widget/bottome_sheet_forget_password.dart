import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/validation_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/logic/auth_logic.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/form_filed/main_form_filed.dart';
import '../../../../core/widget/repeted/charater_city_widget.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import 'move_page_text_widget.dart';
import '../../../../router/app_router.dart';

class BottomeSheetForgetPasswordWidget extends StatelessWidget {
  const BottomeSheetForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    String phoneNumber = '';
    bool enabled = true;
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
        child: Form(
          key: key,
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
              Align(
                alignment: Alignment.centerRight,
                child: TextUtiels(
                  text: AppWordManger.forgetPassword,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: AppFontSizeManger.s24,
                      ),
                  paddingRight: 18.w,
                ),
              ),
              SizedBox(height: 39.h),
              //? filed mobile phone :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CharacterCityWidget(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 10.w,
                    ),
                    child: MainTextFormFiled(
                      validator: (val) {
                        if ((val?.length ?? 0) < 10) {
                          return ValidationWords.phoneNumber;
                        }
                        return null;
                      },
                      enabled: enabled,
                      hintText: AppWordManger.pleaseEnterYourPhoneNumber,
                      onChange: (value) => phoneNumber = value,
                      textInputType: TextInputType.phone,
                      filedWidth: 200.w,
                      filedHeight: 60.h,
                      contentPaddingVertical: 13.h,
                      contentPaddingHorizontal: 27.w,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 39.h),
              //? button for login :
              BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  AuthLogic()
                      .listenerForgetPassword(state, context, phoneNumber);
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading) {
                    return const MainLoadignWidget();
                  }
                  return MainElevatedButton(
                    horizontalPadding: 75.w,
                    text: AppWordManger.sendCodeForEnsure,
                    backgroundColor: AppColorManger.primaryColor,
                    textColor: AppColorManger.white,
                    onPreesed: () {
                      if (key.currentState!.validate()) {
                        context
                            .read<ForgetPasswordCubit>()
                            .forgotPassword(phoneNumber: phoneNumber);
                      }
                      // Navigator.pushNamed(
                      //   context,
                      //   RouteNamedScreens
                      //       .forgetPasswordVerificationCodeScreenNameRoute,
                      // );
                    },
                  );
                },
              ),
              //? any account go to page regestir :
              MovPageText(
                movPageText: AppWordManger.login,
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNamedScreens.loginScreenNameRoute,
                  );
                },
                primaryText: AppWordManger.accountAlradyFind,
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
