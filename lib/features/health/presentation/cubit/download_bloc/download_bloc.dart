import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';
part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final HealthBaseUseCase useCase;
  DownloadBloc(this.useCase) : super(DownloadState.initial()) {
    on<DownloadEvent>((event, emit) async {
      if (event is DownloadFile) {
        emit(state.copyWith(status: DeafultBlocStatus.loading));
        final data =
            await useCase.downloadFile(url: event.url, name: event.name);
        data.fold(
          (failure) => emit(state.copyWith(
              status: DeafultBlocStatus.error,
              failureMessage: mapFailureToMessage(failure: failure))),
          (done) => emit(state.copyWith(status: DeafultBlocStatus.done)),
        );
      }
    }, transformer: droppable());
  }
}
