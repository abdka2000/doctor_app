// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/item.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'user_amount_event.dart';
part 'user_amount_state.dart';

class UserAmountBloc extends Bloc<UserAmountEvent, UserAmountState> {
  final HealthBaseUseCase useCase;
  UserAmountBloc(this.useCase) : super(UserAmountState.initial()) {
    int max = 5;
    on<UserAmountEvent>((event, emit) async {
      if (event is GetUserAmount) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh)
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        if (state.status == DeafultBlocStatus.loading) {
          final data =
              await useCase.getUserAmounts(skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (amount) {
            if (amount.pagedResultDto?.items?.isEmpty ?? true) {
              emit(state.copyWith(hasReachedMax: true));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                userAmount: amount,
                items: amount.pagedResultDto?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getUserAmounts(
              skipCount: state.items.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (amount) {
              if (amount.pagedResultDto?.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      items: List.of(state.items)
                        ..addAll(amount.pagedResultDto?.items ?? []),
                      hasReachedMax: false),
                );
              }
            },
          );
        }
      }
    }, transformer: droppable());
  }
}
