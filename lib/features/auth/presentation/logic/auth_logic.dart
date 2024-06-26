import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      context.read<SendCodeCubit>().sendCode(phoneNum: phoneNumber);
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
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          details: state.failureMessage.details,
          context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(
        context,
        RouteNamedScreens.homeScreenNameRoute,
        // arguments: phoneNumber,
      );
    }
  }
}
