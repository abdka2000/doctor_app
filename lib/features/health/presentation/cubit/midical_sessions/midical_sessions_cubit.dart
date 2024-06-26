import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'midical_sessions_state.dart';

class MidicalSessionsCubit extends Cubit<MidicalSessionsState> {
  MidicalSessionsCubit(this.useCase) : super(MidicalSessionsState.initial());
  final HealthBaseUseCase useCase;
  List<MidicalSession> sessionsList = [];
  int max = 5;
  int skip = 0;
  Future<void> getSessions() async {
    if (!state.hasReachedMax) {
      if (sessionsList.isEmpty) {
        emit(state.copyWith(status: DeafultBlocStatus.loading));
      }
      final data =
          await useCase.getMidicalSession(maxResult: max, skipCount: skip);
      data.fold(
        (failure) => emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        )),
        (sessions) {
          if (sessions.isEmpty) {
            emit(state.copyWith(
              status: DeafultBlocStatus.done,
              hasReachedMax: true,
              sessions: sessionsList,
            ));
            skip = 0;
          } else {
            sessionsList.addAll(sessions);
            skip += 5;
            emit(state.copyWith(
                status: DeafultBlocStatus.done, sessions: sessionsList));
          }
        },
      );
    }
  }
}
