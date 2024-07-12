import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/validation_funcation.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/logic/edit_profile_logic.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/form_filed/text_form_filed_pasword_widget.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../widgets/bacground_profile.dart';
import '../widgets/label_text_form_filed.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    String currentPassword = '';
    String newPassword1 = '';
    String newPassword2 = '';
    bool enabled = true;
    final key = GlobalKey<FormState>();

    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              //? Back Ground Change Password :
              const BackGroundProfile(
                textBackGround: AppWordManger.changePassword,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextUtiels(
                  paddingRight: 30.w,
                  paddingBottome: 11.h,
                  text: AppWordManger.changePassword,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 22.sp,
                      ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextUtiels(
                  paddingRight: 30.w,
                  paddingBottome: 42.h,
                  text: AppWordManger.pleaseWriteSomeThingYouRemember,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 16.sp,
                        color: AppColorManger.black.withOpacity(0.7),
                      ),
                ),
              ),
              //? Filled Passowrd :
              LabelTextFormFiled(
                text: AppWordManger.enterOldPassword,
                paddingTop: 0,
                paddingRight: 34.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 34.w,
                  vertical: 9.h,
                ),
                child: TextFormFiledPassword(
                  enabled: enabled,
                  hintText: AppWordManger.password,
                  onChange: (value) {
                    currentPassword = value;
                  },
                  validator: (val) =>
                      VilidationApp().validatorPassword(val ?? '', context),
                  textInputType: TextInputType.name,
                  contenetPaddingvertical: 20.h,
                  contentPaddingHorizontal: 16.w,
                  filled: false,
                  fillColor: AppColorManger.white,
                  borderColor: AppColorManger.borderColor,
                  borderWidht: 1.3.w,
                  colorHintText: AppColorManger.black.withOpacity(0.5),
                  fontSizeHintText: 16.sp,
                  fontWeightHintText: AppFontWeightManger.fontWeightSemiBold,
                ),
              ),
              SizedBox(height: 21.h),
              //? Filled Password New :
              LabelTextFormFiled(
                text: AppWordManger.newPassword,
                paddingTop: 0,
                paddingRight: 34.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 34.w,
                  vertical: 9.h,
                ),
                child: TextFormFiledPassword(
                  enabled: enabled,
                  hintText: AppWordManger.mustbeSavenNumbers,
                  onChange: (value) {
                    newPassword1 = value;
                  },
                  validator: (val) =>
                      VilidationApp().validatorPassword(val ?? '', context),
                  textInputType: TextInputType.name,
                  contenetPaddingvertical: 20.h,
                  contentPaddingHorizontal: 16.w,
                  filled: false,
                  fillColor: AppColorManger.white,
                  borderColor: AppColorManger.borderColor,
                  borderWidht: 1.3.w,
                  colorHintText: AppColorManger.black.withOpacity(0.5),
                  fontSizeHintText: 16.sp,
                  fontWeightHintText: AppFontWeightManger.fontWeightSemiBold,
                ),
              ),
              SizedBox(height: 21.h),
              //? Filled R Enter Password New :
              LabelTextFormFiled(
                text: AppWordManger.confirmTheNewPassword,
                paddingTop: 0,
                paddingRight: 37.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 34.w,
                  vertical: 9.h,
                ),
                child: TextFormFiledPassword(
                  enabled: enabled,
                  hintText: AppWordManger.reEnterPassword,
                  onChange: (value) {
                    newPassword2 = value;
                  },
                  validator: (val) => VilidationApp()
                      .validateForConfirmPassword(val ?? '', newPassword1),
                  textInputType: TextInputType.name,
                  contenetPaddingvertical: 20.h,
                  contentPaddingHorizontal: 16.w,
                  filled: false,
                  fillColor: AppColorManger.white,
                  borderColor: AppColorManger.borderColor,
                  borderWidht: 1.3.w,
                  colorHintText: AppColorManger.black.withOpacity(0.5),
                  fontSizeHintText: 16.sp,
                  fontWeightHintText: AppFontWeightManger.fontWeightSemiBold,
                ),
              ),
              //? Button for cahnge Password  :
              SizedBox(height: 38.h),
              BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  EditProfileLogic()
                      .listenerChangePassword(state, context, key);
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading) {
                    enabled = false;
                    return const MainLoadignWidget();
                  }
                  enabled = true;
                  return MainElevatedButton(
                    horizontalPadding: 70.w,
                    text: AppWordManger.changePassword,
                    backgroundColor: AppColorManger.secoundryColor,
                    textColor: AppColorManger.white,
                    onPreesed: () {
                      if (key.currentState!.validate()) {
                        // if (newPassword1 == newPassword2) {
                          context.read<ChangePasswordCubit>().changePassword(
                              currentPassword: currentPassword,
                              newPassword: newPassword1);
                        // } else {
                        //   SnackBarUtil.showSnackBar(
                        //       message: "كلمة السر الجديدة غير متطابقة",
                        //       context: context);
                        // }
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 38.h),
            ],
          ),
        ),
      ),
    );
  }
}
