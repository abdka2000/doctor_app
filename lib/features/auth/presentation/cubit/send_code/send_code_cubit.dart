import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';

part 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  SendCodeCubit(this.useCase) : super(SendCodeState.intial());
  final AuthBaseUseCase useCase;
  Future<void> sendCode(
      {required String phoneNum}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.sendCode(phoneNum: phoneNum);
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
