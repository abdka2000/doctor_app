import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/days/days_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/times/times_for_day/times_for_day_cubit.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/shared/shared_pref.dart';
import '../../../../../core/widget/button/main_elevated_button.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/show_dialog/main_show_dialog_widget.dart';
import '../../../../../core/widget/text_utiles/error_text.dart';
import '../../cubit/times/time_today/times_cubit.dart';
import '../../widgets/my_reservation/reservation_details/info_day_weak_widget.dart';
import '../../widgets/my_reservation/reservation_details/app_bar_widget.dart';
import '../../widgets/my_reservation/reservation_details/info_day_widget.dart';
import '../../widgets/my_reservation/reservation_details/info_time_widget.dart';
import '../../widgets/my_reservation/reservation_details/label_text_time_day_widget.dart';
import '../../widgets/my_reservation/reservation_details/label_text_widget.dart';
import '../../../../../router/app_router.dart';

class DetailesReservationPage extends StatelessWidget {
  const DetailesReservationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            //?api : App Bar
            const AppBarReservationDetailsWidget(),
            //? Label Tetx Work Hour :
            LabelTextWidget(
              paddingRight: 20.w,
              paddingTop: 24.h,
              paddingBottome: 12.h,
              text: AppWordManger.reservationAvilable,
            ),
            //? Info Fo Day And Time :
            BlocBuilder<TimesCubit, TimesState>(
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.done) {
                  return InfoDaysAndTimesWidget(
                    times: state.times,
                  );
                } else if (state.status == DeafultBlocStatus.loading) {
                  return MainLoadignWidget(
                    height: 105.h,
                  );
                }
                return ErrorText(
                  text: state.failureMessage.message,
                  height: 105.h,
                );
              },
            ),
            //? Label Tetx bookingReservation :
            LabelTextWidget(
              paddingRight: 18.w,
              paddingTop: 27.h,
              text: AppWordManger.bookingReservation,
            ),
            //? Label Text Day :
            const LabelTextSlider(
              name: AppWordManger.day,
            ),
            //? Info Day :
            BlocBuilder<DaysCubit, DaysState>(
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.done) {
                  return InfoDayWidget(
                    days: state.days,
                  );
                } else if (state.status == DeafultBlocStatus.loading) {
                  return MainLoadignWidget(
                    height: 83.h,
                  );
                }
                return ErrorText(
                  text: state.failureMessage.message,
                  height: 83.h,
                );
              },
            ),
            //? Label Text Time :
            const LabelTextSlider(
              name: AppWordManger.time,
            ),
            //? Info Time :
            BlocBuilder<TimesForDayCubit, TimesForDayState>(
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.done) {
                  return InfoTimesWidget(
                    times: state.times,
                  );
                } else if (state.status == DeafultBlocStatus.loading) {
                  return MainLoadignWidget(
                    height: 70.h,
                  );
                }
                return ErrorText(
                  text: state.failureMessage.message,
                  height: 70.h,
                );
              },
            ),

            //? Button Ensure Resevation :
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
              child: MainElevatedButton(
                text: AppWordManger.reservationConfarmation,
                backgroundColor: AppColorManger.primaryColor,
                textColor: AppColorManger.white,
                onPreesed: () {
                  if (AppSharedPreferences.getToken().isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      RouteNamedScreens.reservationSummaryNameRoute,
                    );
                  } else {
                    MainShowDialog.customShowDialog(
                      onTapBack: () {
                        Navigator.pop(context);
                      },
                      hieght: 150.h,
                      context,
                      onTapFirst: () {
                        Navigator.pop(context);
                      },
                      onTapSecound: () {
                        Navigator.pushReplacementNamed(
                            context, RouteNamedScreens.loginScreenNameRoute);
                      },
                      firstButtonText: AppWordManger.notUntil,
                      secoundButtonText: AppWordManger.login,
                      textPopUp: AppWordManger.loginMustFirst,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
