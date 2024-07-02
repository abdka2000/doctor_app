import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/reservation_base_use_case.dart';

part 'symptoms_state.dart';

class SymptomsCubit extends Cubit<SymptomsState> {
  SymptomsCubit(this.useCase) : super(SymptomsState.initial());
  final ReservationBaseUseCase useCase;
  Future<void> getSymptoms() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final times = await useCase.getSymptoms();
    times.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (symptoms) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          symptoms: symptoms,
        ));
      },
    );
  }
}
