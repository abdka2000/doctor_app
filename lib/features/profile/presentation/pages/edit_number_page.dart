import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/validation_funcation.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_number/edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/logic/edit_profile_logic.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/form_filed/main_form_filed.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/charater_city_widget.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../widgets/bacground_profile.dart';
import '../widgets/label_text_form_filed.dart';
import '../../../../router/app_router.dart';

class EditNumberPage extends StatelessWidget {
  const EditNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            //? Back Ground Edit My Number  :
            const BackGroundProfile(
              textBackGround: AppWordManger.editMyNumber,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 11.h,
                text: AppWordManger.editNumber,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 22.sp,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 42.h,
                text: AppWordManger.pleaseWriteTheNewNumber,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 16.sp,
                      color: AppColorManger.black.withOpacity(0.7),
                    ),
              ),
            ),
            //? Filed For Write Phone Number :
            LabelTextFormFiled(
              text: AppWordManger.newNumber,
              paddingTop: 0,
              paddingRight: 17.w,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CharacterCityWidget(
                  paddingTop: 20.h,
                  paddingbottome: 20.h,
                ),
                MainTextFormFiled(
                  enabled: true,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  hintText: AppWordManger.pleaseWritePhoneNumber,
                  filedWidth: 260.w,
                  onChange: (value) {},
                  textInputType: TextInputType.number,
                  fillColor: AppColorManger.white,
                  borderColor: AppColorManger.borderColor,
                  borderWidht: 1.3.w,
                  contentPaddingVertical: 19.h,
                  contentPaddingHorizontal: 16.w,
                  hintTextColor: AppColorManger.black.withOpacity(0.5),
                  fontSize: 15.sp,
                  controller: controller,
                ),
              ],
            ),
            SizedBox(height: 59.h),
            //? Button For Sure Info :
            BlocConsumer<EditNumberCubit, EditNumberState>(
              listener: (context, state) {
                EditProfileLogic()
                    .listenerEditNumber(state, context, controller);
              },
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading) {
                  return const MainLoadignWidget();
                }
                return MainElevatedButton(
                  horizontalPadding: 120,
                  verticalPadding: 10,
                  text: AppWordManger.sure,
                  backgroundColor: AppColorManger.secoundryColor,
                  textColor: AppColorManger.white,
                  onPreesed: () {
                    context
                        .read<EditNumberCubit>()
                        .editNumber(phoneNumber: controller.text);
                  },
                );
              },
            ),
            SizedBox(height: 38.h),
          ],
        ),
      ),
    );
  }
}
