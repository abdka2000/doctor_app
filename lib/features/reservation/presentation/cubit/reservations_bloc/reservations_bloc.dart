import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_item/reservation_item.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/reservation_base_use_case.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'reservations_event.dart';
part 'reservations_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  final ReservationBaseUseCase useCase;
  ReservationsBloc(this.useCase) : super(ReservationsState.initial()) {
    int max = 5;
    on<ReservationsEvent>((event, emit) async {
      if (event is GetReservations) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh) {
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        }
        if (state.status == DeafultBlocStatus.loading) {
          final data = await useCase.getReservation(
              isFinished: event.isFinished, skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (reservation) {
            if (reservation.items?.isEmpty ?? true) {
              emit(state.copyWith(hasReachedMax: true));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                reservations: reservation.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getReservation(
              isFinished: event.isFinished,
              skipCount: state.reservations.length,
              maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (reservation) {
              if (reservation.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      reservations: List.of(state.reservations)
                        ..addAll(reservation.items ?? []),
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
