import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';

part 'confirm_edit_number_state.dart';

class ConfirmEditNumberCubit extends Cubit<ConfirmEditNumberState> {
  ConfirmEditNumberCubit(this.useCase)
      : super(ConfirmEditNumberState.initial());
  final ProfileBaseUseCase useCase;
  Future<void> confirmEditNumber(
      {required String phoneNumber, required String code}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.confirmEditPhoneNumber("0$phoneNumber", code);
    data.fold(
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
      },
    );
  }
}
