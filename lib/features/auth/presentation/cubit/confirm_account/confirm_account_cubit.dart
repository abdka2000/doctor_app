import 'package:bloc/bloc.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../domin/usecases/auth_base_usecase.dart';
import 'confirm_account_state.dart';

class ConfirmAccountCubit extends Cubit<ConfirmAccountState> {
  ConfirmAccountCubit({required this.useCase})
      : super(ConfirmAccountState.intial());
  final AuthBaseUseCase useCase;
  Future<void> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data =
        await useCase.confirmAccount(phoneNumber: phoneNumber, code: code);
    data.fold(
      (failure) {
        emit(
          state.copyWith(
            failureMessage: mapFailureToMessage(failure: failure),
            status: DeafultBlocStatus.error,
          ),
        );
      },
      (done) {
        emit(
          state.copyWith(
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }
}
