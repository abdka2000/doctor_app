import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/button/main_elevated_button.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../../../../core/widget/show_dialog/main_show_dialog_widget.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../widgets/reservation_now/reservation_summary/card_summary.dart';
import '../../widgets/reservation_now/reservation_summary/card_symptoms.dart';
import '../../widgets/reservation_now/reservation_summary/choose_type_symptoms.dart';
import '../../../../../router/app_router.dart';

class SummaryReservationPage extends StatefulWidget {
  const SummaryReservationPage({super.key});

  @override
  State<SummaryReservationPage> createState() => _SummaryReservationPageState();
}

bool visible = false;
bool cancleButton = false;
List<bool> check = List.generate(6, (_) => false);
List<String> seek = [
  'الزكام',
  'الدوار',
  'الحمى',
  'وجع المعدة',
  'وجع الرأس',
  'غير ذلك'
];

class _SummaryReservationPageState extends State<SummaryReservationPage> {
  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.detailsReservatio,
              onTap: () => Navigator.pop(context),
              paddingBottome: 35.h,
            ),
            //? Card Summary :
            const CardSummaryWidget(),
            CardSymptomsWidget(
              onTap: () {
                setState(() {
                  visible = !visible;
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextUtiels(
                                    text: seek[index],
                                    fontFamily: AppFontFamily.tajawalMedium,
                                    fontSize: 14.sp,
                                    color: check[index]
                                        ? AppColorManger.primaryColor
                                        : AppColorManger.colorGrayLight,
                                  ),
                                  Checkbox(
                                    value: check[index],
                                    onChanged: (value) {
                                      setState(() {
                                        check[index] = value!;
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
                    ),
                  ),
                ),
              ),
            ),

            //? Button For Continuse Resrvation :
            Padding(
              padding: EdgeInsets.symmetric(vertical: !visible ? 200.h : 0),
              child: MainElevatedButton(
                text: AppWordManger.continueReservation,
                backgroundColor: AppColorManger.primaryColor,
                textColor: AppColorManger.textColor1,
                horizontalPadding: 110.w,
                onPreesed: () {
                  MainShowDialog.customShowDialog(context,
                      onTapBack: () {
                        Navigator.pop(context);
                      },
                      firstButtonText: AppWordManger.home,
                      secoundButtonText: AppWordManger.myReservation,
                      textPopUp:
                          '${AppWordManger.doneReservationSucces}\n في \n 2:15   2023/8/25',
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
