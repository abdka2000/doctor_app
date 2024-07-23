import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/create_appoinment/create_appoinment_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/reservations_bloc/reservations_bloc.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/symptoms_bloc/symptoms_bloc.dart';
import 'package:hosptel_app/router/app_router.dart';

class ReservationLogic {
  symptompsListener(
    BuildContext context,
    SymptomsState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.items.length < 3) {
        context.read<SymptomsBloc>().add(GetSymptoms());
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.9)) {
          context.read<SymptomsBloc>().add(GetSymptoms());
        }
      });
    }
  }

  reservationDoneListener(
    BuildContext context,
    ReservationsState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.reservations.length < 3) {
        context
            .read<ReservationsBloc>()
            .add(const GetReservations(isFinished: true));
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context
              .read<ReservationsBloc>()
              .add(const GetReservations(isFinished: true));
        }
      });
    }
  }

  reservationWaitingListener(
    BuildContext context,
    ReservationsState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.reservations.length < 3) {
        context
            .read<ReservationsBloc>()
            .add(const GetReservations(isFinished: false));
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context
              .read<ReservationsBloc>()
              .add(const GetReservations(isFinished: false));
        }
      });
    }
  }

  createAppoinmentListener(
    BuildContext context,
    CreateAppoinmentState state,
    bool visible,
    String date,
    String time,
  ) {
    if (state.status == DeafultBlocStatus.done) {
      MainShowDialog.customShowDialog(context,
          onTapBack: () {
            Navigator.pop(context);
          },
          firstButtonText: AppWordManger.home,
          secoundButtonText: AppWordManger.myReservation,
          textPopUp:
              '${AppWordManger.doneReservationSucces}\n في \n $time   $date',
          onTapFirst: () {
            Navigator.pushReplacementNamed(
              context,
              RouteNamedScreens.homeScreenNameRoute,
            );
          },
          onTapSecound: () {
            Navigator.pushReplacementNamed(
              context,
              RouteNamedScreens.reservationNameRoute,
            );
            visible = false;
          });
    } else if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message,
          context: context,
          details: state.failureMessage.details);
    }
  }
}
