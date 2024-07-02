import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';

part 'navigate_state.dart';

class NavigateCubit extends Cubit<NavigateState> {
  NavigateCubit() : super(NavigateInitial());
  void checkAuth() {
    if (AppSharedPreferences.getToken().isEmpty) {
      emit(UnAuthinticateState());
    } else {
      emit(AuthinticateState());
    }
  }
}
