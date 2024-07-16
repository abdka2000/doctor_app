// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session_entity/item.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

part 'midical_sessions_event.dart';
part 'midical_sessions_state.dart';

class MidicalSessionsBloc
    extends Bloc<MidicalSessionsEvent, MidicalSessionsState> {
  final HealthBaseUseCase useCase;
  MidicalSessionsBloc(this.useCase) : super(MidicalSessionsState.initial()) {
    int max = 5;
    on<MidicalSessionsEvent>((event, emit) async {
      if (event is GetUserMidicalSessions) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh)
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        if (state.status == DeafultBlocStatus.loading) {
          final data =
              await useCase.getMidicalSession(skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (sessions) {
            if (sessions.result?.items?.isEmpty ?? true) {
              emit(state.copyWith(hasReachedMax: true));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                sessions: sessions.result?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getMidicalSession(
              skipCount: state.sessions.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (sessions) {
              if (sessions.result?.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      sessions: List.of(state.sessions)
                        ..addAll(sessions.result?.items ?? []),
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
