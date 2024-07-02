import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import 'package:hosptel_app/features/home/domain/usecases/home_base_usecase.dart';

part 'doctor_info_state.dart';

class DoctorInfoCubit extends Cubit<DoctorInfoState> {
  DoctorInfoCubit(this.useCase) : super(DoctorInfoState.initial());
  final HomeBaseUseCase useCase;
  Future<void> getDoctorInfo() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getDoctorInfo();
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (info) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          info: info,
        ));
      },
    );
  }
}
