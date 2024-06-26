import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/png_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../widgets/mony_account/card_pymant_widget.dart';
import '../widgets/mony_account/const_card_widget.dart';
import '../widgets/mony_account/info_mony_account.dart';

class MonyAccountPage extends StatelessWidget {
  const MonyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.finisialAccount,
              onTap: () => Navigator.pop(context),
              paddingBottome: 15.h,
            ),
            //? Image Account :
            Image.asset(
              width: 100.w,
              height: 100.h,
              AppPngManger.imageProfile,
            ),
            //? NAME :
            TextUtiels(
              text: 'لمى الطويل',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 20.sp,
                    color: AppColorManger.textColor2,
                  ),
            ),
            //? Number Phone
            TextUtiels(
              text: '0935059855',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 20.sp,
                    color: AppColorManger.lightText,
                  ),
            ),
            //? Carad Pymant :
            const CardPymantWidget(),
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
              child: const InfoMonyAccountWidget(),
            ),
            //? Cost Full :
            const CostCardWidget()
          ],
        ),
      ),
    );
  }
}
