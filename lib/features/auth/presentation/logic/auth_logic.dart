import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/send_code/send_code_cubit.dart';
import '../../../../core/resources/enum_manger.dart';
import '../../../../core/widget/sanck_bar/main_snack_bar.dart';
import '../cubit/create_Account/create_account_state.dart';
import '../cubit/login/login_cubit.dart';
import '../../../../router/app_router.dart';

class AuthLogic {
  void listenerCreateAccount(
    CreateAccountState state,
    BuildContext context,
    String phoneNumber,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(
        context,
        RouteNamedScreens.reciveNumberVerificationPageScreenNameRoute,
        arguments: phoneNumber,
      );
    }
  }

  void listenerLogIn(
    LoginState state,
    BuildContext context,
    String phoneNumber,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      if (state.failureMessage.details != "True") {
        SnackBarUtil.showSnackBar(
            message: state.failureMessage.message,
            details: state.failureMessage.details,
            context: context);
      } else {
        Navigator.pushNamed(context,
            RouteNamedScreens.reciveNumberVerificationPageScreenNameRoute,
            arguments: phoneNumber);
        // context.read<SendCodeCubit>().sendCode(phoneNum: phoneNumber);
      }
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(context, AppWordManger.sendCodeForEnsure);
    }
  }

  void listenerResetPassword(
    ForgetPasswordState state,
    BuildContext context,
    String phoneNumber,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      SnackBarUtil.showSnackBar(
          message: AppWordManger.saveDone, context: context, isSucces: true);
      Navigator.pushNamed(
        context,
        RouteNamedScreens.loginScreenNameRoute,
        // arguments: phoneNumber,
      );
    }
  }

  void listenerForgetPassword(
    ForgetPasswordState state,
    BuildContext context,
    String phoneNumber,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(
        context,
        RouteNamedScreens.forgetPasswordVerificationCodeScreenNameRoute,
        arguments: phoneNumber,
      );
    }
  }

  void listenerSendCode(
    BuildContext context,
    SendCodeState state,
  ) {
    if (state.status == DeafultBlocStatus.loading) {
      MainShowDialog.loadingDialog(context: context);
    } else if (state.status == DeafultBlocStatus.error) {
      Navigator.pop(context);
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pop(context);
    }
  }
}
