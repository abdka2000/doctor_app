// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/item.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'user_prescriptions_event.dart';
part 'user_prescriptions_state.dart';

class UserPrescriptionsBloc
    extends Bloc<UserPrescriptionsEvent, UserPrescriptionState> {
  final HealthBaseUseCase useCase;
  UserPrescriptionsBloc(this.useCase) : super(UserPrescriptionState.initial()) {
    int max = 5;
    on<UserPrescriptionsEvent>((event, emit) async {
      if (event is GetUserPrescriptions) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh)
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        if (state.status == DeafultBlocStatus.loading) {
          final data =
              await useCase.getUserPrescriptions(skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (prescriptions) {
            if (prescriptions.result?.items?.isEmpty ?? true) {
              emit(state.copyWith(
                  hasReachedMax: true, status: DeafultBlocStatus.done));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                userPrescriptions: prescriptions.result?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getUserPrescriptions(
              skipCount: state.userPrescriptions.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (prescriptions) {
              if (prescriptions.result?.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      userPrescriptions: List.of(state.userPrescriptions)
                        ..addAll((Iterable.castFrom(
                            prescriptions.result!.items!.toList()))),
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
