import 'package:bloc/bloc.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../domin/entities/req/create_account_request_entite.dart';
import '../../../domin/usecases/auth_base_usecase.dart';
import 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit({required this.useCase})
      : super(CreateAccountState.intial());
  final AuthBaseUseCase useCase;
  Future<void> createAccount(
      {required CreateAccoutRequestEntite request}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.createAccount(request: request);
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
