// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/features/reservation/presentation/logic/reservation_logic.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/loading/main_loading.dart';
import '../../../../../core/widget/repeted/error_text.dart';
import '../../../domain/entities/reservation_item/reservation_item.dart';
import '../../cubit/reservations/reservation_cubit.dart';
import 'card_reservation_widget.dart';
import 'not_found_resevation.dart';
import 'pop_up_cancle_reservation.dart';

class WaitingReservation extends StatelessWidget {
  const WaitingReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<ReservationCubit>()
            .getReservations(isFinished: false, isRefresh: true);
      },
      child: BlocConsumer<ReservationCubit, ReservationState>(
        listener: (context, state) {
          ReservationLogic()
              .reservationWaitingListener(context, state, controller);
        },
        builder: (context, state) {
          if (state.status == DeafultBlocStatus.done) {
            if (state.reservations.isNotEmpty) {
              return waitingReservationsList(
                  state.reservations, state.hasReachedMax, controller);
            } else {
              return const NotFoundReservationWidget();
            }
          } else if (state.status == DeafultBlocStatus.error) {
            return ErrorTextWidget(
              text: state.failureMessage.message,
              onPressed: () => context.read<ReservationCubit>().getReservations(
                    isFinished: false,
                    isRefresh: true,
                  ),
            );
          }
          return const MainLoadignWidget();
        },
      ),
    );
  }
}

ListView waitingReservationsList(
  List<ReservationItemEntity> reservations,
  bool hasReachedMax,
  ScrollController controller,
) {
  return ListView.builder(
    controller: controller,
    itemCount: reservations.length + 1,
    itemBuilder: (context, index) {
      if (index == reservations.length && !hasReachedMax) {
        return const MainLoadignWidget();
      } else if (index == reservations.length && hasReachedMax)
        return null;
      else
        return CardReservationWidget(
          item: reservations[index],
          iconCardReservatio: AppSvgManger.iconReservation,
          showButtonCancleResvation: true,
          showDivider: true,
          onTapCancleReservation: () {
            MainShowDialogCansleResevation.customShowDialog(
              context,
            );
          },
        );
    },
  );
}
