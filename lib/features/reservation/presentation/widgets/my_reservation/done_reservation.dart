// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/reservations_bloc/reservations_bloc.dart';
import 'package:hosptel_app/features/reservation/presentation/logic/reservation_logic.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/loading/main_loading.dart';
import '../../../../../core/widget/repeted/error_text.dart';
import '../../../domain/entities/reservation_item/reservation_item.dart';
import 'card_reservation_widget.dart';
import 'not_found_resevation.dart';

class DoneReservation extends StatelessWidget {
  const DoneReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<ReservationsBloc>()
            .add(const GetReservations(isFinished: true, isRefresh: true));
      },
      child: BlocConsumer<ReservationsBloc, ReservationsState>(
        listener: (context, state) {
          ReservationLogic()
              .reservationDoneListener(context, state, controller);
        },
        builder: (context, state) {
          if (state.status == DeafultBlocStatus.done) {
            if (state.reservations.isNotEmpty) {
              return doneReservationsList(
                  state.reservations, state.hasReachedMax, controller);
            } else {
              return const NotFoundReservationWidget();
            }
          } else if (state.status == DeafultBlocStatus.error) {
            return ErrorTextWidget(
                text: state.failureMessage.message,
                onPressed: () => context.read<ReservationsBloc>().add(
                    const GetReservations(isFinished: true, isRefresh: true)));
          }
          return const MainLoadignWidget();
        },
      ),
    );
  }

  ListView doneReservationsList(
    List<ReservationItemEntity> reservation,
    bool hasReachedMax,
    ScrollController controller,
  ) {
    return ListView.builder(
      controller: controller,
      itemCount: reservation.length + 1,
      itemBuilder: (context, index) {
        if (index == reservation.length && !hasReachedMax) {
          return const MainLoadignWidget();
        } else if (index == reservation.length && hasReachedMax)
          return null;
        else
          return CardReservationWidget(
            item: reservation[index],
            iconCardReservatio: AppSvgManger.iconFinishedResevation,
            showButtonCancleResvation: false,
            showDivider: false,
          );
      },
    );
  }
}
