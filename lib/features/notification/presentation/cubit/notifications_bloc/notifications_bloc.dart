import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/item.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notifications_base_use_case.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsBaseUseCase useCase;
  NotificationsBloc(this.useCase) : super(NotificationsState.initial()) {
    int max = 5;
    on<NotificationsEvent>((event, emit) async {
      if (event is GetNotifications) {
        if (state.hasReachedMax && !event.isRefresh) return;
        if (event.isRefresh) {
          emit(state.copyWith(status: DeafultBlocStatus.loading));
        }
        if (state.status == DeafultBlocStatus.loading) {
          final data =
              await useCase.getNotifications(skipCount: 0, maxResult: max);
          data.fold(
              (failure) => emit(state.copyWith(
                    failureMessage: mapFailureToMessage(failure: failure),
                    status: DeafultBlocStatus.error,
                  )), (notifications) {
            if (notifications.result?.items?.isEmpty ?? true) {
              emit(state.copyWith(
                  hasReachedMax: true, status: DeafultBlocStatus.done));
            } else {
              emit(state.copyWith(
                status: DeafultBlocStatus.done,
                notifications: notifications.result?.items,
                hasReachedMax: false,
              ));
            }
          });
        } else {
          final data = await useCase.getNotifications(
              skipCount: state.notifications.length, maxResult: max);
          data.fold(
            (failure) => emit(state.copyWith(
              failureMessage: mapFailureToMessage(failure: failure),
              status: DeafultBlocStatus.error,
            )),
            (notifications) {
              if (notifications.result?.items?.isEmpty ?? true) {
                emit(state.copyWith(
                    hasReachedMax: true, status: DeafultBlocStatus.done));
              } else {
                emit(
                  state.copyWith(
                      status: DeafultBlocStatus.done,
                      notifications: List.of(state.notifications)
                        ..addAll(notifications.result?.items ?? []),
                      hasReachedMax: false),
                );
              }
            },
          );
        }
      } else if (event is MakeNotifictionsReaded) {
        //TODO
        List<int?> notificationsId = state.notifications.map((notification) {
          if (notification.isReaded == false) return notification.id;
        }).toList();
        await useCase.setNotificationsReaded(ids: notificationsId);
      }
    }, transformer: droppable());
  }
}
