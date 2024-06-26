import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/function/maping_falure.dart';
import '../../../../../../core/resources/enum_manger.dart';
import '../../../../domain/entities/available_times/available_times.dart';
import '../../../../domain/usecases/reservation_base_use_case.dart';

part 'times_state.dart';

class TimesCubit extends Cubit<TimesState> {
  TimesCubit(this.useCase) : super(TimesState.initial());
  final ReservationBaseUseCase useCase;
  Future<void> getTodaysTimes() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final thisDay = DateTime.now().toString();
    final times = await useCase.getAvailablesTime(date: thisDay);
    times.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (times) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          times: times,
        ));
      },
    );
  }
}
