import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import '../../../../function/navigation_funcation.dart';
import 'button_nav_state.dart';

class ButtonNavCubit extends Cubit<ButtonNavBarState> {
  ButtonNavCubit() : super(ButtonNavBarState.intial());

  void changeIndexButtonNav(int index, BuildContext context) {
    if (index == 2 && AppSharedPreferences.getToken().isEmpty) {
      emit(state.copyWith(buttonNavBarIndex: index));
    } else {
      routingNamePage(index, context);
      emit(state.copyWith(buttonNavBarIndex: index));
    }
  }
}
