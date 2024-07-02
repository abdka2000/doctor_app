import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/item.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'prescription_details_state.dart';

class PrescriptionDetailsCubit extends Cubit<PrescriptionDetailsState> {
  PrescriptionDetailsCubit(this.useCase)
      : super(PrescriptionDetailsState.initial());
  final HealthBaseUseCase useCase;
  List<Item> prescriptionList = [];
  int max = 5;
  int skip = 0;
  Future<void> getPrescriptionDetails({required int prescriptionId}) async {
    if (!state.hasReachedMax) {
      if (prescriptionList.isEmpty) {
        emit(state.copyWith(status: DeafultBlocStatus.loading));
      }
      final data = await useCase.getPrescriptionItemDetails(
        maxResult: max,
        skipCount: skip,
        prescriptionId: prescriptionId,
      );
      data.fold(
        (failure) => emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        )),
        (prescription) {
          if (prescriptionList.isEmpty) {
            emit(state.copyWith(
              status: DeafultBlocStatus.done,
              hasReachedMax: true,
              prescriptionDetails: prescriptionList,
            ));
            skip = 0;
          } else {
            prescriptionList.addAll(prescription.result?.items?.toList() ?? []);
            skip += 5;
            emit(state.copyWith(
                status: DeafultBlocStatus.done,
                prescriptionDetails: prescriptionList));
          }
        },
      );
    }
  }
}
