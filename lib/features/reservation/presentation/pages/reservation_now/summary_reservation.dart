// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/appointment_symptom.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/create_appoinment/create_appoinment_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/symptoms_bloc/symptoms_bloc.dart';
import 'package:hosptel_app/features/reservation/presentation/logic/reservation_logic.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/info_day_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/info_time_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/reservation_now/reservation_summary/symptoms_error.dart';
import 'package:intl/intl.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/button/main_elevated_button.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../widgets/reservation_now/reservation_summary/card_summary.dart';
import '../../widgets/reservation_now/reservation_summary/card_symptoms.dart';
import '../../widgets/reservation_now/reservation_summary/choose_type_symptoms.dart';

class SummaryReservationPage extends StatefulWidget {
  const SummaryReservationPage({super.key, required this.times});
  final Map<String, dynamic> times;

  @override
  State<SummaryReservationPage> createState() => _SummaryReservationPageState();
}

bool visible = false;
bool cancleButton = false;

class _SummaryReservationPageState extends State<SummaryReservationPage> {
  List<int> symptomsId = [];
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.detailsReservatio,
              onTap: () {
                Navigator.pop(context);
                visible = false;
              },
              paddingBottome: 35.h,
            ),
            //? Card Summary :
            CardSummaryWidget(
              date: widget.times['date'].toString(),
              fromTime: widget.times['fromTime'] ?? '',
            ),
            CardSymptomsWidget(
              onTap: () {
                setState(() {
                  visible = !visible;
                  context.read<SymptomsBloc>().add(GetSymptoms());
                });
              },
            ),
            //? Chose Tyoe Symptoms
            Visibility(
              visible: visible,
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 27.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: 200.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: AppColorManger.whiteColorCard,
                        border: Border.all(
                          color: AppColorManger.colorBorder,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColorManger.balckCheck.withOpacity(0.25),
                            offset: const Offset(4, 4),
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: BlocConsumer<SymptomsBloc, SymptomsState>(
                        listener: (context, state) {
                          ReservationLogic()
                              .symptompsListener(context, state, controller);
                        },
                        builder: (context, state) {
                          if (state.status == DeafultBlocStatus.done) {
                            if (state.items.isNotEmpty) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      controller: controller,
                                      itemCount: state.items.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index == state.items.length &&
                                            !state.hasReachedMax) {
                                          return const MainLoadignWidget();
                                        } else if (index ==
                                                state.items.length &&
                                            state.hasReachedMax) {
                                          return null;
                                        } else
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 150.h,
                                                child: TextUtiels(
                                                  text:
                                                      state.items[index].name ??
                                                          '',
                                                  fontFamily: AppFontFamily
                                                      .tajawalMedium,
                                                  fontSize: 14.sp,
                                                  color: symptomsId.contains(
                                                          state.items[index].id)
                                                      ? AppColorManger
                                                          .primaryColor
                                                      : AppColorManger
                                                          .colorGrayLight,
                                                ),
                                              ),
                                              Checkbox(
                                                value: symptomsId.contains(
                                                    state.items[index].id),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (symptomsId.contains(
                                                        state
                                                            .items[index].id)) {
                                                      symptomsId.remove(state
                                                              .items[index]
                                                              .id ??
                                                          0);
                                                    } else {
                                                      symptomsId.add(state
                                                              .items[index]
                                                              .id ??
                                                          0);
                                                    }
                                                  });
                                                },
                                              ),
                                            ],
                                          );
                                      },
                                    ),
                                  ),
                                  //? button done Or cancle :
                                  ButtonDoneAndCancle(
                                    onTap: () {
                                      setState(() {
                                        visible = false;
                                      });
                                    },
                                  )
                                ],
                              );
                            } else {
                              return const Center(
                                child: TextUtiels(
                                  text: 'لا يوجد أعراض',
                                  color: Colors.black,
                                ),
                              );
                            }
                          } else if (state.status ==
                              DeafultBlocStatus.loading) {
                            return const MainLoadignWidget();
                          }
                          return SymptomsError(
                              text: state.failureMessage.message,
                              onPreesed: () {
                                context.read<SymptomsBloc>().add(GetSymptoms());
                              });
                        },
                      )),
                ),
              ),
            ),

            //? Button For Continuse Resrvation :
            Padding(
              padding: EdgeInsets.symmetric(vertical: !visible ? 200.h : 0),
              child: BlocConsumer<CreateAppoinmentCubit, CreateAppoinmentState>(
                listener: (context, state) {
                  ReservationLogic().createAppoinmentListener(
                      context,
                      state,
                      visible,
                      selectedDay!.date!.replaceRange(10, null, ''),
                      selectedTime!.fromTime!);
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading) {
                    return const MainLoadignWidget();
                  }
                  return MainElevatedButton(
                      text: AppWordManger.continueReservation,
                      backgroundColor: AppColorManger.primaryColor,
                      textColor: AppColorManger.textColor1,
                      horizontalPadding: 110.w,
                      onPreesed: () {
                        final reservation = ReservationResponse(
                          startTime: selectedTime?.fromTime ??
                              DateFormat.jm().format(DateTime.now()),
                          endTime: selectedTime?.toTime ??
                              DateFormat.jm().format(DateTime.now()),
                          appointmentDate: DateTime.parse(
                              selectedDay!.date ?? DateTime.now().toString()),
                          appointmentSymptoms: symptomsId
                              .map((id) => AppointmentSymptom(symptomId: id))
                              .toList(),
                        );
                        context
                            .read<CreateAppoinmentCubit>()
                            .createAppoinment(reservations: reservation);
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
