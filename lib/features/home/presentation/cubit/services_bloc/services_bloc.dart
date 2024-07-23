// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/home/data/models/doctor_services/item_model.dart';
import 'package:hosptel_app/features/home/domain/usecases/home_base_usecase.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final HomeBaseUseCase useCase;
  ServicesBloc(this.useCase) : super(ServicesState.initial()) {
    int max = 5;
    on<ServicesEvent>((event, emit) async {
      if (event is GetServices) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh)
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        if (state.status == DeafultBlocStatus.loading) {
          final data =
              await useCase.getServicesUseCase(skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (services) {
            if (services.result?.items?.isEmpty ?? true) {
              emit(state.copyWith(
                  hasReachedMax: true, status: DeafultBlocStatus.done));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                services: services.result?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getServicesUseCase(
              skipCount: state.services.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (services) {
              if (services.result?.items?.isEmpty ?? true) {
                emit(state.copyWith(hasReachedMax: true));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      services: List.of(state.services)
                        ..addAll(services.result?.items ?? []),
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
