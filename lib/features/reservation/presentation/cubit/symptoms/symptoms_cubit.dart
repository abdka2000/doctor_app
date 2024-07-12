// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/item.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/reservation_base_use_case.dart';

part 'symptoms_state.dart';

class SymptomsCubit extends Cubit<SymptomsState> {
  SymptomsCubit(this.useCase) : super(SymptomsState.initial());
  final ReservationBaseUseCase useCase;

  List<Item> symptomssList = [];
  int max = 5;
  int skip = 0;

  Future<void> getSymptoms() async {
    if (!state.hasReachedMax) {
      if (symptomssList.isEmpty) {
        emit(state.copyWith(status: DeafultBlocStatus.loading));
      }
      final times = await useCase.getSymptoms(maxResult: max, skipCount: skip);
      times.fold(
        (failure) {
          emit(state.copyWith(
            failureMessage: mapFailureToMessage(failure: failure),
            status: DeafultBlocStatus.error,
          ));
        },
        (symptoms) {
          if (symptomssList.length <= (symptoms.result?.totalCount ?? 0)) {
            symptomssList.addAll(symptoms.result?.items ?? []);
            emit(state.copyWith(
              status: DeafultBlocStatus.done,
              items: symptomssList,
            ));
            skip += 5;
            print('--------------------${symptomssList.length}');
          } else {
            emit(state.copyWith(
                status: DeafultBlocStatus.done,
                hasReachedMax: true,
                items: symptomssList));
            skip = 0;
            print('--------------------${symptomssList.length}');
          }
          // if (symptomssList.length >= (symptoms.result?.totalCount ?? 0) ||
          //     (symptoms.result?.items?.isEmpty ?? true)) {
          //   emit(state.copyWith(
          //       status: DeafultBlocStatus.done,
          //       hasReachedMax: true,
          //       items: symptomssList));
          //   skip = 0;
          //   print('--------------------${symptomssList.length}');
          // } else {
          //   symptomssList.addAll(symptoms.result?.items ?? []);
          //   emit(state.copyWith(
          //     status: DeafultBlocStatus.done,
          //     items: symptomssList,
          //   ));
          //   skip += 5;
          // }
        },
      );
    }
  }
}
