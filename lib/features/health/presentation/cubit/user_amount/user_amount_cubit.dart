import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/item.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'user_amount_state.dart';

class UserAmountCubit extends Cubit<UserAmountState> {
  UserAmountCubit(this.useCase) : super(UserAmountState.initial());
  final HealthBaseUseCase useCase;

  List<Item> amountsList = [];
  int max = 5;
  int skip = 0;

  Future<void> getUserAmount({bool isRefresh = false}) async {
    if (!state.hasReachedMax || isRefresh) {
      if (amountsList.isEmpty || isRefresh) {
        emit(state.copyWith(status: DeafultBlocStatus.loading));
      }
      final data =
          await useCase.getUserAmounts(skipCount: skip, maxResult: max);
      data.fold(
        (failure) {
          emit(state.copyWith(
            failureMessage: mapFailureToMessage(failure: failure),
            status: DeafultBlocStatus.error,
          ));
        },
        (userAmount) {
          if (amountsList.length ==
              (userAmount.pagedResultDto?.totalCount ?? 0)) {
            emit(state.copyWith(
                status: DeafultBlocStatus.done,
                hasReachedMax: true,
                items: amountsList,
                userAmount: userAmount));
            skip = 0;
          } else {
            amountsList
                .addAll(userAmount.pagedResultDto?.items?.toList() ?? []);
            skip += 5;
            emit(state.copyWith(
                status: DeafultBlocStatus.done,
                items: amountsList,
                userAmount: userAmount));
          }
        },
      );
    }
  }
}
