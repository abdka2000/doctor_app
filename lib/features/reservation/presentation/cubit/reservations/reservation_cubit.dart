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
  Future<void> getReservations({required bool isFinished}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getReservation(isFinished: isFinished);
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (reservations) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          reservations: reservations,
        ));
      },
    );
  }
}
