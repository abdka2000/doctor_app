import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/item.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'patient_files_state.dart';

class PatientFilesCubit extends Cubit<PatientFilesState> {
  PatientFilesCubit(this.useCase) : super(PatientFilesState.initial());
  final HealthBaseUseCase useCase;
  List<Item> filesList = [];
  int max = 5;
  int skip = 0;
  Future<void> getPatientFiles({bool isRefresh = false}) async {
    if(!state.hasReachedMax || isRefresh){
      if (filesList.isEmpty || isRefresh) {
      emit(state.copyWith(status: DeafultBlocStatus.loading));
    }
    final data = await useCase.getUserFiles(maxResult: max, skipCount: skip);
    data.fold(
      (failure) => emit(state.copyWith(
        failureMessage: mapFailureToMessage(failure: failure),
        status: DeafultBlocStatus.error,
      )),
      (files) {
        if (filesList.length == (files.result?.totalCount ?? 0)) {
          emit(state.copyWith(
            status: DeafultBlocStatus.done,
            hasReachedMax: true,
            files: filesList,
          ));
          skip = 0;
        } else {
          filesList.addAll(files.result?.items?.toList() ?? []);
          skip += 5;
          emit(
              state.copyWith(status: DeafultBlocStatus.done, files: filesList));
        }
      },
    );
    }
  }
}
