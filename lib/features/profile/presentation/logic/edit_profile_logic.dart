import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_number/confirm_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/delete_account/delete_account_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_number/edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:hosptel_app/router/app_router.dart';

class EditProfileLogic {
  void listenerEditProfile(
    EditProfileState state,
    BuildContext context,
    String name,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          context: context,
          details: state.failureMessage.details);
    } else if (state.status == DeafultBlocStatus.done) {
      AppSharedPreferences.cashUserName(name: name);
      context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      SnackBarUtil.showSnackBar(
          context: context, message: AppWordManger.saveDone, isSucces: true);
    }
  }

  void listenerEditNumber(EditNumberState state, BuildContext context,
      TextEditingController controller) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          context: context,
          details: state.failureMessage.details);
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(
          context, RouteNamedScreens.verificationEditNumberNameRoute,
          arguments: controller.text);
    }
  }

  void listenerConfirmEditNumber(
    ConfirmEditNumberState state,
    BuildContext context,
    String phoneNumber,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          context: context,
          details: state.failureMessage.details);
    } else if (state.status == DeafultBlocStatus.done) {
      AppSharedPreferences.cashPhoneNumber(phoneNumber: "0$phoneNumber");
      print("---------- number has Updated!");
      SnackBarUtil.showSnackBar(
        message: AppWordManger.saveDone,
        context: context,
        isSucces: true,
      );
      context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
    }
  }

  void listenerChangePassword(
    ChangePasswordState state,
    BuildContext context,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          context: context,
          details: state.failureMessage.details);
    } else if (state.status == DeafultBlocStatus.done) {
      SnackBarUtil.showSnackBar(
        message: AppWordManger.saveDone,
        context: context,
        isSucces: true,
      );
      context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
    }
  }

  void deleteAccountListener(DeleteAccountState state, BuildContext context) {
    if (state.status == DeafultBlocStatus.done) {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.loginScreenNameRoute);
      context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
    } else if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          context: context,
          details: state.failureMessage.details);
      Navigator.pop(context);
      Navigator.pop(context);
    } else if (state.status == DeafultBlocStatus.loading) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: SizedBox(
                    width: 100.h,
                    height: 100.h,
                    child: const MainLoadignWidget()),
              ));
    }
  }
}
