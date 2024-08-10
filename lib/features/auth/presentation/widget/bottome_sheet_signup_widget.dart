import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/function/deate_function.dart';
import '../../../../core/function/validation_funcation.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/enum_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/form_filed/main_form_filed.dart';
import '../../../../core/widget/loading/main_loading.dart';
import '../../../../core/widget/repeted/charater_city_widget.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../../core/widget/form_filed/text_form_filed_pasword_widget.dart';
import '../../domin/entities/req/create_account_request_entite.dart';
import '../cubit/create_Account/create_account_cubit.dart';
import '../cubit/create_Account/create_account_state.dart';
import '../logic/auth_logic.dart';
import 'move_page_text_widget.dart';
import '../../../profile/presentation/widgets/gender_back_widget.dart';
import '../../../../router/app_router.dart';

class BottomeSheetSignUpWidget extends StatefulWidget {
  const BottomeSheetSignUpWidget({
    super.key,
  });

  @override
  State<BottomeSheetSignUpWidget> createState() =>
      _BottomeSheetSignUpWidgetState();
}

class _BottomeSheetSignUpWidgetState extends State<BottomeSheetSignUpWidget> {
  GlobalKey<FormState> formKeyCreateAccount = GlobalKey();
  CreateAccoutRequestEntite request = CreateAccoutRequestEntite();
  late TextEditingController controller;
  bool enabled = true;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 520.h,
      decoration: BoxDecoration(
        color: AppColorManger.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Form(
        key: formKeyCreateAccount,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
            vertical: 12.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  width: 20.w,
                  height: 4.h,
                  AppSvgManger.rowBottomeSheet,
                ),
                SizedBox(height: 20.h),
                //? full name filed  :
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: MainTextFormFiled(
                    enabled: enabled,
                    hintText: AppWordManger.fullName,
                    validator: (value) => VilidationApp().validator(value!),
                    onChange: (value) {
                      request.fullName = value;
                    },
                    textInputType: TextInputType.name,
                    filedWidth: 250.w,
                    filedHeight: 60.h,
                    contentPaddingVertical: 13.h,
                    contentPaddingHorizontal: 27.w,
                  ),
                ),
                //? filed mobile phone :
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CharacterCityWidget(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          left: 10.w,
                        ),
                        child: SizedBox(
                          width: 200.w,
                          height: 60.h,
                          child: MainTextFormFiled(
                            enabled: enabled,
                            hintText: AppWordManger.pleaseEnterYourPhoneNumber,
                            onChange: (value) {
                              request.phomeNumber = value;
                            },
                            validator: (value) =>
                                VilidationApp().validator(value!),
                            textInputType: TextInputType.phone,
                            contentPaddingVertical: 13.h,
                            contentPaddingHorizontal: 25.w,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //? filed  Paswword :
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: TextFormFiledPassword(
                    hintText: AppWordManger.password,
                    onChange: (value) {
                      request.password = value;
                    },
                    validator: (value) =>
                        VilidationApp().validatorPassword(value!, context),
                    textInputType: TextInputType.visiblePassword,
                    filedWidth: 275,
                    filedHeight: 60,
                  ),
                ),
                //? filed birthDay :
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: MainTextFormFiled(
                    enabled: enabled,
                    validator: (value) => VilidationApp().validator(value!),
                    readOnly: true,
                    controller: controller,
                    onTap: () async {
                      await selecteDate(context, controller);
                      request.birhdDay = controller.text;
                    },
                    suffixIcon: Icons.calendar_month_outlined,
                    hintText: AppWordManger.birthDay,
                    onChange: (value) {},
                    textInputType: TextInputType.name,
                    filedWidth: 275.w,
                    filedHeight: 60.h,
                    contentPaddingVertical: 13.h,
                    contentPaddingHorizontal: 25.w,
                  ),
                ),
                //? choose Gender :
                Padding(
                  padding: EdgeInsets.only(
                    right: 6.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenderBackWidget(
                        requestEntite: request,
                        texts: const [AppWordManger.fmeal, AppWordManger.meal],
                        marginRight: 10.w,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 22.h),
                        decoration: BoxDecoration(
                          color: AppColorManger.fillColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: TextUtiels(
                          text: AppWordManger.gander,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 13.sp,
                                fontFamily: AppFontFamily.tajawalBold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                //? button for Gust  :
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
                  horizontalPadding: 80.w,
                ),
                SizedBox(height: 20.h),
                //? button for Create Account  :
                BlocConsumer<CreateAccountCubit, CreateAccountState>(
                  listener: (context, state) {
                    AuthLogic().listenerCreateAccount(
                        state, context, request.phomeNumber ?? "");
                  },
                  builder: (context, state) {
                    if (state.status == DeafultBlocStatus.loading) {
                      enabled = false;
                      return const MainLoadignWidget();
                    }
                    enabled = true;
                    return MainElevatedButton(
                      text: AppWordManger.createAccount,
                      backgroundColor: AppColorManger.primaryColor,
                      textColor: AppColorManger.white,
                      onPreesed: () {
                        if (formKeyCreateAccount.currentState!.validate()) {
                          context
                              .read<CreateAccountCubit>()
                              .createAccount(request: request);
                        }
                      },
                    );
                  },
                ),
                //? any account go to page login :
                MovPageText(
                  movPageText: AppWordManger.login,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNamedScreens.loginScreenNameRoute,
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
