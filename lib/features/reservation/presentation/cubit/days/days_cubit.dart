import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../domain/entities/availabe_day/available_days.dart';
import '../../../domain/usecases/reservation_base_use_case.dart';

part 'days_state.dart';

class DaysCubit extends Cubit<DaysState> {
  DaysCubit(this.useCase) : super(DaysState.initial());
  final ReservationBaseUseCase useCase;
  Future<void> getDays() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final days = await useCase.getAvailableDays();
    days.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (days) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          days: days,
        ));
      },
    );
  }
}
