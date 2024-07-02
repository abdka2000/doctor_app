import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'user_amount_state.dart';

class UserAmountCubit extends Cubit<UserAmountState> {
  UserAmountCubit(this.useCase) : super(UserAmountState.initial());
  final HealthBaseUseCase useCase;
  Future<void> getUserAmount() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getUserAmounts();
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (userAmount) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          userAmount: userAmount,
        ));
      },
    );
  }
}
