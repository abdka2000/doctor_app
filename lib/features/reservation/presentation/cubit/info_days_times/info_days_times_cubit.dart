import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/user_work_hours.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../domain/usecases/reservation_base_use_case.dart';

part 'info_days_times_state.dart';

class InfoDaysTimesCubit extends Cubit<InfoDaysTimesState> {
  InfoDaysTimesCubit(this.useCase) : super(InfoDaysTimesState.initial());
  final ReservationBaseUseCase useCase;
  Future<void> getDaysAndTimes() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final times = await useCase.getWorkHours();
    times.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (hours) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          hours: hours,
        ));
      },
    );
  }
}
