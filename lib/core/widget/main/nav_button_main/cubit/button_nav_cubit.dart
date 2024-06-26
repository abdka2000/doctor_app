import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../function/navigation_funcation.dart';
import 'button_nav_state.dart';

class ButtonNavCubit extends Cubit<ButtonNavBarState> {
  ButtonNavCubit() : super(ButtonNavBarState.intial());

  void changeIndexButtonNav(int index, BuildContext context) {
    routingNamePage(index, context);
    emit(state.copyWith(buttonNavBarIndex: index));
  }
}
