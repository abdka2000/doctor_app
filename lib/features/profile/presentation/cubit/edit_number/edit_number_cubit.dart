import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';

part 'edit_number_state.dart';

class EditNumberCubit extends Cubit<EditNumberState> {
  EditNumberCubit(this.useCase) : super(EditNumberState.initial());
   final ProfileBaseUseCase useCase;
  Future<void> editNumber({required String phoneNumber}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.editPhoneNumber("0$phoneNumber");
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
