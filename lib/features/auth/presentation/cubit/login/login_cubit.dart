import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../domin/entities/req/login_request_entite.dart';
import '../../../domin/usecases/auth_base_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.useCase}) : super(LoginState.intial());
  final AuthBaseUseCase useCase;
  Future<void> login({
    required LoginRequest request,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.logIn(request: request);
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (done) {
        emit(state.copyWith(status: DeafultBlocStatus.done));
      },
    );
  }
}
