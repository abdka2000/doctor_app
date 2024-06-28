import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account/create_account_state.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_number/confirm_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_number/edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/pop_up_cancle_reservation.dart';
import 'package:hosptel_app/router/app_router.dart';

class EditProfileLogic {
  void listenerEditProfile(
    EditProfileState state,
    BuildContext context,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          context: context,
          details: state.failureMessage.details);
    } else if (state.status == DeafultBlocStatus.done) {
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
}
