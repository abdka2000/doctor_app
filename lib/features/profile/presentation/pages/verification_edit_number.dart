import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_verification_code.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_number/confirm_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_number/edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/logic/edit_profile_logic.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/button/main_elevated_button.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../auth/presentation/widget/move_page_text_widget.dart';
import '../widgets/bacground_profile.dart';
import '../../../../router/app_router.dart';

class VerficationEditNumber extends StatelessWidget {
  const VerficationEditNumber({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    String code = '';
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            //? Back Ground Verification My Number :
            const BackGroundProfile(
              textBackGround: AppWordManger.editMyNumber,
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 11.h,
                text: AppWordManger.writeNumber,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 22.sp,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 18.h,
                text: AppWordManger.aCodeisSentViaTextMessageTo,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ),
            //?Api :
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingBottome: 3.h,
                text: '+963 $phoneNumber',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 16.sp,
                    ),
                paddingRight: 18.w,
              ),
            ),
            //? Edit Number :
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNamedScreens.editNumberNameRoute,
                  );
                },
                child: TextUtiels(
                  text: AppWordManger.editNumber,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                  paddingRight: 18.w,
                  paddingBottome: 30.h,
                ),
              ),
            ),
            //? Filed For Verfication Code :
            PinCodeFiledWidget(
              onCompleted: (val) {
                code = val;
              },
            ),
            SizedBox(height: 59.h),
            //? Button For sure character :
            BlocConsumer<ConfirmEditNumberCubit, ConfirmEditNumberState>(
              listener: (context, state) {
                EditProfileLogic()
                    .listenerConfirmEditNumber(state, context, phoneNumber);
              },
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading) {
                  return const MainLoadignWidget();
                }
                return MainElevatedButton(
                  horizontalPadding: 90.w,
                  verticalPadding: 11.h,
                  text: AppWordManger.codeNumber,
                  backgroundColor: AppColorManger.secoundryColor,
                  textColor: AppColorManger.white,
                  onPreesed: () {
                    context.read<ConfirmEditNumberCubit>().confirmEditNumber(
                          phoneNumber: phoneNumber,
                          code: code,
                        );
                  },
                );
              },
            ),
            //? Dont Recive Any Code Number :
            MovPageText(
              movPageText: AppWordManger.resendMessage,
              onTap: () {
                context
                    .read<EditNumberCubit>()
                    .editNumber(phoneNumber: phoneNumber);
                Navigator.pushNamed(
                    context, RouteNamedScreens.verificationEditNumberNameRoute,
                    arguments: phoneNumber);
              },
              primaryText: AppWordManger.dontGetVerificationCode,
            ),
          ],
        ),
      ),
    );
  }
}
