import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/function/validation_funcation.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/enum_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/form_filed/main_form_filed.dart';
import '../../../../core/widget/loading/main_loading.dart';
import '../../../../core/widget/repeted/charater_city_widget.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../../core/widget/form_filed/text_form_filed_pasword_widget.dart';
import '../../domin/entities/req/login_request_entite.dart';
import '../cubit/login/login_cubit.dart';
import '../logic/auth_logic.dart';
import 'move_page_text_widget.dart';
import '../../../../router/app_router.dart';

class BottomeSheetLoginWidget extends StatelessWidget {
  const BottomeSheetLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';
    String password = '';
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
            horizontal: 35.w,
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
                SizedBox(height: 28.h),
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
                      child: SizedBox(
                        height: 60.h,
                        width: 200.w,
                        child: MainTextFormFiled(
                          enabled: enabled,
                          validator: (value) =>
                              VilidationApp().validator(value!),
                          hintText: AppWordManger.pleaseEnterYourPhoneNumber,
                          onChange: (value) {
                            phoneNumber = "0$value";
                          },
                          textInputType: TextInputType.phone,
                          contentPaddingVertical: 13.h,
                          contentPaddingHorizontal: 27.w,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(9),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //? filed  Paswword :
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                  child: TextFormFiledPassword(
                    enabled: enabled,
                    hintText: AppWordManger.password,
                    onChange: (value) {
                      password = value;
                    },
                    validator: (value) =>
                        VilidationApp().validatorPassword(value!, context),
                    textInputType: TextInputType.visiblePassword,
                    filedWidth: 275,
                    filedHeight: 60,
                  ),
                ),
                SizedBox(height: 5.h),
                //? forget password :
                Padding(
                  padding: EdgeInsets.only(left: 160.r, bottom: 13.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNamedScreens.forgetPasswordPage,
                      );
                    },
                    child: TextUtiels(
                      text: AppWordManger.forgotYourPassword,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10.sp,
                          ),
                    ),
                  ),
                ),

                //? button for login :
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    AuthLogic().listenerLogIn(state, context, phoneNumber);
                  },
                  builder: (context, state) {
                    if (state.status == DeafultBlocStatus.loading) {
                      enabled = false;
                      return const MainLoadignWidget();
                    }
                    enabled = true;
                    return MainElevatedButton(
                      text: AppWordManger.login,
                      backgroundColor: AppColorManger.primaryColor,
                      textColor: AppColorManger.white,
                      onPreesed: () {
                        if (formKeyLogin.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                                  request: LoginRequest(
                                isGuest: false,
                                phoneNumber: phoneNumber,
                                password: password,
                              ));
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 20.h),

                //? Guest Button :
                MainElevatedButton(
                  text: AppWordManger.loginGust,
                  backgroundColor: AppColorManger.secoundryColor,
                  textColor: AppColorManger.white,
                  onPreesed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNamedScreens.homeScreenNameRoute,
                      (route) => false,
                    );
                  },
                  // horizontalPadding: 80.w,
                ),
                SizedBox(height: 20.h),

                //? any account go to page regestir :
                MovPageText(
                  movPageText: AppWordManger.createAccount,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNamedScreens.signUpScreenNameRoute,
                    );
                  },
                  primaryText: AppWordManger.dontHaveAnAccountAlreadyPlease,
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
if (state.status == DeafultBlocStatus.error) {
                      SnackBarUtil.showSnackBar(
                        message: state.failureMessage.message,
                        context: context,
                      );
                    } else if (state.status == DeafultBlocStatus.done) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNamedScreens.homeScreenNameRoute,
                        (route) => false,
                      );
                    }
*/
