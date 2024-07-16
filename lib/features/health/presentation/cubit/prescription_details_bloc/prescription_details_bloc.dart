// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/item.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'prescription_details_event.dart';
part 'prescription_details_state.dart';

class PrescriptionDetailsBloc
    extends Bloc<PrescriptionDetailsEvent, PrescriptionDetailsState> {
  final HealthBaseUseCase useCase;
  PrescriptionDetailsBloc(this.useCase)
      : super(PrescriptionDetailsState.initial()) {
    int max = 5;
    on<PrescriptionDetailsEvent>((event, emit) async {
if (event is GetPrescriptionDetails) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh)
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        if (state.status == DeafultBlocStatus.loading) {
          final data =
              await useCase.getPrescriptionItemDetails(prescriptionId: event.prescriptionId,skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (prescreptions) {
            if (prescreptions.result?.items?.isEmpty ?? true) {
              emit(state.copyWith(hasReachedMax: true));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                prescriptionDetails: prescreptions.result?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getPrescriptionItemDetails(
            prescriptionId: event.prescriptionId,
              skipCount: state.prescriptionDetails.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (prescription) {
              if (prescription.result?.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      prescriptionDetails: List.of(state.prescriptionDetails)
                        ..addAll(prescription.result?.items ?? []),
                      hasReachedMax: false),
                );
              }
            },
          );
        }
      }    },transformer: droppable());
  }
}
