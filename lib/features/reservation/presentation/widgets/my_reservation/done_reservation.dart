import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/loading/main_loading.dart';
import '../../../../../core/widget/text_utiles/error_text.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../domain/entities/reservation_item/reservation_item.dart';
import '../../cubit/reservations/reservation_cubit.dart';
import 'card_reservation_widget.dart';
import 'not_found_resevation.dart';

class DoneReservation extends StatelessWidget {
  const DoneReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.done) {
          if (state.reservations.isNotEmpty) {
            return doneReservationsList(state.reservations);
          } else {
            return const NotFoundReservationWidget();
          }
        } else if (state.status == DeafultBlocStatus.error) {
          return ErrorText(text: state.failureMessage.message);
        }
        return const MainLoadignWidget();
      },
    );
  }

  ListView doneReservationsList(List<ReservationItemEntity> reservation) {
    return ListView.builder(
      itemCount: reservation.length,
      itemBuilder: (context, index) => CardReservationWidget(
        item: reservation[index],
        iconCardReservatio: AppSvgManger.iconFinishedResevation,
        showButtonCancleResvation: false,
        showDivider: false,
      ),
    );
  }
}
