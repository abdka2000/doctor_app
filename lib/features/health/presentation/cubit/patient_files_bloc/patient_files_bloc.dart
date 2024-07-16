// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/item.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'patient_files_event.dart';
part 'patient_files_state.dart';

class PatientFilesBloc extends Bloc<PatientFilesEvent, PatientFilesState> {
  final HealthBaseUseCase useCase;
  PatientFilesBloc(this.useCase) : super(PatientFilesState.initial()) {
    int max = 5;
    on<PatientFilesEvent>((event, emit) async {
      if (event is GetUserFiles) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh)
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        if (state.status == DeafultBlocStatus.loading) {
          final data = await useCase.getUserFiles(skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (files) {
            if (files.result?.items?.isEmpty ?? true) {
              emit(state.copyWith(hasReachedMax: true));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                files: files.result?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getUserFiles(
              skipCount: state.files.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (files) {
              if (files.result?.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      files: List.of(state.files)
                        ..addAll(files.result?.items ?? []),
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
