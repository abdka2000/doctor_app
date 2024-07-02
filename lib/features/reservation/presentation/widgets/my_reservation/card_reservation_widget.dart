import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../domain/entities/reservation_item/reservation_item.dart';

class CardReservationWidget extends StatelessWidget {
  const CardReservationWidget({
    super.key,
    required this.iconCardReservatio,
    required this.showButtonCancleResvation,
    required this.showDivider,
    this.onTapCancleReservation,
    required this.item,
  });
  final ReservationItemEntity item;
  final String iconCardReservatio;
  final bool showButtonCancleResvation;
  final bool showDivider;
  final void Function()? onTapCancleReservation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20, right: 20, top: 32, bottom: 16).r,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.5.h),
        width: 320.w,
        height: 250.h,
        decoration: BoxDecoration(
          color: AppColorManger.fillColorCard,
          border: Border.all(
            color: AppColorManger.primaryColor,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            //? Number Reservation :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //? Number Reservation From Api :
                TextUtiels(
                  paddingRight: 14.w,
                  text: item.id.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorManger.colorShowDailogButton,
                        fontSize: 16.sp,
                        fontWeight: AppFontWeightManger.fontWeightExtraBold,
                      ),
                ),
                TextUtiels(
                  text: AppWordManger.numberResevation,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorManger.colorShowDailogButton,
                        fontSize: 16.sp,
                        fontWeight: AppFontWeightManger.fontWeightExtraBold,
                      ),
                ),
              ],
            ),
            Divider(
              color: AppColorManger.black.withOpacity(0.17),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      //? Name Doctor From (Api)
                      TextUtiels(
                        //TODO : it's not static
                        text: 'د.علي محمد',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColorManger.colorShowDailogButton,
                              fontSize: 16.sp,
                              fontWeight:
                                  AppFontWeightManger.fontWeightExtraBold,
                            ),
                      ),
                      //? Text Date Resevation From Api :
                      TextUtiels(
                        text:
                            ' ${DateFormat.yMd().add_jm().format(item.appointmentDate ?? DateTime.now())} : ${AppWordManger.dataReservation}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColorManger.colorShowDailogButton,
                              fontSize: 16.sp,
                              fontWeight:
                                  AppFontWeightManger.fontWeightExtraBold,
                            ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    width: 71.w,
                    height: 67.h,
                    iconCardReservatio,
                  ),
                ],
              ),
            ),
            //? Dividing :
            Visibility(
              visible: showDivider,
              child: Divider(
                color: AppColorManger.black.withOpacity(0.17),
              ),
            ),
            //? Button For Cancle Resevation :
            Visibility(
              visible: showButtonCancleResvation,
              child: GestureDetector(
                onTap: onTapCancleReservation,
                child: TextUtiels(
                  paddingTop: 5.h,
                  text: AppWordManger.cansleResevation,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
