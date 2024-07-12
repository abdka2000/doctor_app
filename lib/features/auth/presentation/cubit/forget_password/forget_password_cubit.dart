import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.useCase) : super(ForgetPasswordState.intial());
  final AuthBaseUseCase useCase;

  //? Forgot Password:
  Future<void> forgotPassword(
      {required String phoneNumber, bool isResend = false}) async {
    !isResend ? emit(state.copyWith(status: DeafultBlocStatus.loading)) : null;
    final data = await useCase.forgotPassword(phoneNumber: phoneNumber);
    data.fold(
      (failure) {
        !isResend
            ? emit(
                state.copyWith(
                  failureMessage: mapFailureToMessage(failure: failure),
                  status: DeafultBlocStatus.error,
                ),
              )
            : null;
      },
      (done) {
        !isResend
            ? emit(
                state.copyWith(
                  status: DeafultBlocStatus.done,
                ),
              )
            : null;
      },
    );
  }

  //? Confirm Forgot Password Code:
  Future<void> confirmForgotPassword(
      {required String phoneNumber, required String code}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.confirmForgotPassword(
        phoneNumber: phoneNumber, code: code);
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

  //? Reset Password:
  Future<void> resetPasswrd(
      {required String phoneNumber,
      required String code,
      required String password}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.resetPassword(
        phoneNumber: phoneNumber, code: code, newPassword: password);
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
