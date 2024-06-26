import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.useCase) : super(ChangePasswordState.initial());
  final ProfileBaseUseCase useCase;
  Future<void> changePassword({required String currentPassword , required String newPassword}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.changePassword(currentPassword,newPassword);
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
