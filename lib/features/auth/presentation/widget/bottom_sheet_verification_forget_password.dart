import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/enum_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/form_filed/text_form_filed_verification_code.dart';
import '../../../../core/widget/loading/main_loading.dart';
import '../../../../core/widget/sanck_bar/main_snack_bar.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import 'move_page_text_widget.dart';
import '../../../../router/app_router.dart';

String code = '';

class BottomeSheetVerifivcationForgetPassword extends StatelessWidget {
  const BottomeSheetVerifivcationForgetPassword({
    Key? key,
    required this.numberPhone,
    required this.fontSizeSubText,
    required this.fontColorSubText,
    required this.fontFamailySubText,
  }) : super(key: key);

  final String numberPhone;
  final double fontSizeSubText;
  final Color fontColorSubText;
  final String fontFamailySubText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
            ),
            child: Center(
              child: SvgPicture.asset(
                width: 20.w,
                height: 4.h,
                AppSvgManger.rowBottomeSheet,
              ),
            ),
          ),
          //? This is Icon Back And Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 14.w),
                  child: SvgPicture.asset(
                    width: 30.w,
                    height: 30.h,
                    AppSvgManger.iconArrow,
                  ),
                ),
              ),
              TextUtiels(
                paddingRight: 19.w,
                text: AppWordManger.writeNumber,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: AppFontSizeManger.s24,
                    ),
              ),
            ],
          ),
          TextUtiels(
            paddingRight: 19.w,
            paddingTop: 10.h,
            text: 'استخدم الرمز المرسل لك للتحقق من الوصول إلى حسابك ',
            color: AppColorManger.balckCheck,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
          TextUtiels(
            text: '',
            color: fontColorSubText,
            fontSize: fontSizeSubText,
            fontFamily: fontFamailySubText,
            paddingTop: 10.h,
            paddingRight: 18.w,
            // paddingBottome: 10.h,
          ),
          //? Confirm Code
          PinCodeFiledWidget(
            onChange: (value) {},
            onCompleted: (vale) {
              code = vale;
            },
          ),
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state.status == DeafultBlocStatus.error) {
                SnackBarUtil.showSnackBar(
                  message: state.failureMessage.message,
                  context: context,
                );
              } else if (state.status == DeafultBlocStatus.done) {
                List<String> args = [numberPhone, code];
                Navigator.pushNamed(
                    context, RouteNamedScreens.resetPasswordRoute,
                    arguments: args);
              }
            },
            builder: (context, state) {
              if (state.status == DeafultBlocStatus.loading) {
                return const MainLoadignWidget();
              }
              return Center(
                child: MainElevatedButton(
                  horizontalPadding: 90.w,
                  text: AppWordManger.doneVerification,
                  backgroundColor: AppColorManger.primaryColor,
                  textColor: AppColorManger.white,
                  onPreesed: () {
                    context.read<ForgetPasswordCubit>().confirmForgotPassword(
                          phoneNumber: numberPhone,
                          code: code,
                        );
                  },
                ),
              );
            },
          ),
          MovPageText(
            movPageText: AppWordManger.resendMessage,
            onTap: () {
              context
                  .read<ForgetPasswordCubit>()
                  .forgotPassword(phoneNumber: numberPhone, isResend: true);
              SnackBarUtil.showSnackBar(
                  message: 'تم إعادة إرسال الرمز',
                  context: context,
                  isSucces: true);
            },
            primaryText: AppWordManger.dontGetVerificationCode,
          ),
        ],
      ),
    );
  }
}
