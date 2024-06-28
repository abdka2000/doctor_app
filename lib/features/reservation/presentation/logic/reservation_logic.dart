import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/reservations/reservation_cubit.dart';

class ReservationLogic {
  reservationDoneListener(
    BuildContext context,
    ReservationState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      controller.addListener(() {
        if (controller.offset == controller.position.maxScrollExtent) {
          context.read<ReservationCubit>().getReservations(isFinished: true);
        }
      });
    }
  }

  reservationWaitingListener(
    BuildContext context,
    ReservationState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      controller.addListener(() {
        if (controller.offset == controller.position.maxScrollExtent) {
          context.read<ReservationCubit>().getReservations(isFinished: false);
        }
      });
    }
  }
}
