
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_services/item_entity.dart';

class InfoServicesItem extends StatelessWidget {
  const InfoServicesItem({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(vertical: 9.5.h, horizontal: 15.w),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  color: AppColorManger.black.withOpacity(0.25),
                )
              ],
              color: AppColorManger.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: AppColorManger.primaryColor,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            // child: SvgPicture.asset(
            //   'assets/image/svg/mackup.svg',
            // ),
            // child: items[index].imageUrl != null
            //     ? SvgPicture.network(
            //         items[index].imageUrl!,
            //       ):
            child: SvgPicture.asset(
              'assets/image/svg/mackup.svg',
            ),
          ),
          TextUtiels(
            fontFamily: AppFontFamily.tajawalLight,
            textAlign: TextAlign.center,
            // text: 'العلاج\n بالأوكسجين',
            text: item.name ?? '',
            color: AppColorManger.textColor1,
            fontSize: AppFontSizeManger.s13,
            height: 1.5.h,
          )
        ],
      ),
    );
  }
}
