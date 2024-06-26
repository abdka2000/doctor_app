import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
import '../cubit/confirm_account/confirm_account_cubit.dart';
import '../cubit/confirm_account/confirm_account_state.dart';
import 'move_page_text_widget.dart';
import '../../../../router/app_router.dart';

String code = '';

class BottomeSheetVerifivcationWidget extends StatelessWidget {
  const BottomeSheetVerifivcationWidget({
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
            text: 'تم إرسال رمز برسالة نصية إلى ',
            color: AppColorManger.lightColor,
            fontSize: 17.sp,
          ),
          TextUtiels(
            text: numberPhone,
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
          BlocConsumer<ConfirmAccountCubit, ConfirmAccountState>(
            listener: (context, state) {
              if (state.status == DeafultBlocStatus.error) {
                SnackBarUtil.showSnackBar(
                  message: state.failureMessage.message,
                  context: context,
                );
              } else if (state.status == DeafultBlocStatus.done) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNamedScreens.loginScreenNameRoute,
                  (route) => false,
                );
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
                    context.read<ConfirmAccountCubit>().confirmAccount(
                          phoneNumber: numberPhone.split(' ')[1],
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
              print(numberPhone.split(' ')[1]);
            },
            primaryText: AppWordManger.dontGetVerificationCode,
          ),
        ],
      ),
    );
  }
}
