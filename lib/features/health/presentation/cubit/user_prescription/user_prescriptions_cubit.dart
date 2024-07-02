import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/item.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'user_prescriptions_state.dart';

class UserPrescriptionsCubit extends Cubit<UserPrescriptionState> {
  UserPrescriptionsCubit(this.useCase) : super(UserPrescriptionState.initial());
  final HealthBaseUseCase useCase;
  List<Item> prescriptionList = [];
  int max = 5;
  int skip = 0;
  Future<void> getUserPrescriptions() async {
    if (!state.hasReachedMax) {
      if (prescriptionList.isEmpty) {
        emit(state.copyWith(status: DeafultBlocStatus.loading));
      }
      final data = await useCase.getUserPrescriptions(
        maxResult: max,
        skipCount: skip,
      );
      data.fold(
        (failure) => emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        )),
        (prescriptions) {
          if (prescriptionList.length == (prescriptions.result?.totalCount ?? 0)) {
            emit(state.copyWith(
              status: DeafultBlocStatus.done,
              hasReachedMax: true,
              userPrescriptions: prescriptionList,
            ));
            skip = 0;
          } else {
            prescriptionList
                .addAll(prescriptions.result?.items?.toList() ?? []);
            skip += 5;
            emit(state.copyWith(
                status: DeafultBlocStatus.done,
                userPrescriptions: prescriptionList));
          }
        },
      );
    }
  }
}
