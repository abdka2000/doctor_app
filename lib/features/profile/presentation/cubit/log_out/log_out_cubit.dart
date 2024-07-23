import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this.useCase) : super(LogOutState.initial());
  final ProfileBaseUseCase useCase;
  Future<void> logOut() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final person = await useCase.logOut();
    person.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (done) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
        ));
        AppSharedPreferences.clear();
      },
    );
  }
}
