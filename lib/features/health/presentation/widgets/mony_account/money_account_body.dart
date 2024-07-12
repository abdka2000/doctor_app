import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/item.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/card_pymant_widget.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/const_card_widget.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/info_mony_account.dart';

class MoneyAccountBody extends StatelessWidget {
  const MoneyAccountBody(
      {super.key,
      required this.userAmount,
      required this.items,
      required this.hasReachedMax,
      required this.controller});
  final UserAmountEntity userAmount;
  final List<Item> items;
  final bool hasReachedMax;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //? Carad Pymant :
        CardPymantWidget(
          pushedAmount: userAmount.pushTotalAmount ?? 0.0,
        ),
        //? Detailes :
        Align(
          alignment: Alignment.centerRight,
          child: TextUtiels(
            paddingRight: 21.w,
            paddingTop: 28.5.h,
            text: AppWordManger.details,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 20.sp,
                  color: AppColorManger.textColor2,
                ),
          ),
        ),
        //? Card Detailse :
        Container(
          width: 320.w,
          height: 180.h,
          // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 23.h),
          decoration: BoxDecoration(
              color: AppColorManger.fillColorCard,
              boxShadow: [
                BoxShadow(
                  color: AppColorManger.shadowColorGray.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(5.r)),
          child: InfoMonyAccountWidget(
            controller: controller,
            hasReachedMax: hasReachedMax,
            items: items,
          ),
        ),
        //? Cost Full :
        CostCardWidget(
          totalAmount: userAmount.deptTotalAmount ?? 0.0,
        )
      ],
    );
  }
}
