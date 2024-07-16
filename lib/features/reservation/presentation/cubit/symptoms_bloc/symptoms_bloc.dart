import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/item.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/reservation_base_use_case.dart';

part 'symptoms_event.dart';
part 'symptoms_state.dart';

class SymptomsBloc extends Bloc<SymptomsEvent, SymptomsState> {
  final ReservationBaseUseCase useCase;
  SymptomsBloc(this.useCase) : super(SymptomsState.initial()) {
    int max = 5;
    on<SymptomsEvent>((event, emit) async {
      if (event is GetSymptoms) {
        if (state.hasReachedMax) return;
        if (state.status == DeafultBlocStatus.loading) {
          final data = await useCase.getSymptoms(skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (symptoms) {
            if (symptoms.result?.items?.isEmpty ?? true) {
              emit(state.copyWith(hasReachedMax: true));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                items: symptoms.result?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getSymptoms(
              skipCount: state.items.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (symptoms) {
              if (symptoms.result?.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      items: List.of(state.items)
                        ..addAll(symptoms.result?.items ?? []),
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
