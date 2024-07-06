import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../domain/entities/reservation_item/reservation_item.dart';
import '../../../domain/usecases/reservation_base_use_case.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this.useCase) : super(ReservationState.initial());
  final ReservationBaseUseCase useCase;

  List<ReservationItemEntity> reservationsList = [];
  int max = 5;
  int skip = 0;

  Future<void> getReservations({required bool isFinished}) async {
    if (reservationsList.isEmpty) {
      emit(state.copyWith(status: DeafultBlocStatus.loading));
    }
    final data = await useCase.getReservation(
      isFinished: isFinished,
      maxResult: max,
      skipCount: skip,
    );
    data.fold(
      (failure) => emit(state.copyWith(
        failureMessage: mapFailureToMessage(failure: failure),
        status: DeafultBlocStatus.error,
      )),
      (reservations) {
        if (reservationsList.length == (reservations.totalCount ?? 0)) {
          emit(state.copyWith(
              status: DeafultBlocStatus.done,
              hasReachedMax: true,
              reservations: reservationsList));
          skip = 0;
        } else {
          skip += 5;
          reservationsList.addAll(reservations.items ?? []);
          emit(state.copyWith(
              status: DeafultBlocStatus.done, reservations: reservationsList));
        }
      },
    );
  }
}
