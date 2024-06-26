import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import '../../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../cubit/reservations/reservation_cubit.dart';
import '../../widgets/my_reservation/done_reservation.dart';
import '../../widgets/my_reservation/tab_bar_widget.dart';
import '../../widgets/my_reservation/waiting_reservation.dart';
import '../../../../../router/app_router.dart';
import '../../../../../injection/injection_container.dart' as di;

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.homeScreenNameRoute,
        );
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      child: DefaultTabController(
        length: 2,
        child: MainBackGround(
          mainBody: Column(
            children: [
              //? Title Reservation :
              const TitlePageWidget(
                titleText: AppWordManger.myReservation,
              ),
              //? Tab Bar Widget  :
              const TabBarWidget(),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    //? Resevation Finished :
                    BlocProvider(
                      create: (context) => di.sl<ReservationCubit>()
                        ..getReservations(isFinished: true),
                      child: const DoneReservation(),
                    ),
                    //? Resevation As Soon As Wating  :
                    BlocProvider(
                      create: (context) => di.sl<ReservationCubit>()
                        ..getReservations(isFinished: false),
                      child: const WaitingReservation(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
