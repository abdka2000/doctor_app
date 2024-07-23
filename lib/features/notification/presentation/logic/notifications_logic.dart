import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/notifications_bloc/notifications_bloc.dart';

class NotificationsLogic {
  void notificationsListener(
    BuildContext context,
    NotificationsState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      // TODO: Edit the number
      if (state.notifications.length < 5) {
        context.read<NotificationsBloc>().add(const GetNotifications());
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<NotificationsBloc>().add(const GetNotifications());
        }
      });
    }
    context.read<NotificationsBloc>().add(MakeNotifictionsReaded());
    print("Notifications Readed");
  }
}
