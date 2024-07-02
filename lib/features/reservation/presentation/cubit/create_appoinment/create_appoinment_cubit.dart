import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/reservation_base_use_case.dart';

part 'create_appoinment_state.dart';

class CreateAppoinmentCubit extends Cubit<CreateAppoinmentState> {
  CreateAppoinmentCubit(this.useCase) : super(CreateAppoinmentState.initial());
  final ReservationBaseUseCase useCase;
  Future<void> createAppoinment(
      {required ReservationResponse reservations}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.createAppoinment(reservation: reservations);
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (done) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
        ));
      },
    );
  }
}
