import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
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
            padding: EdgeInsets.symmetric(vertical: 9.5.h, horizontal: 15.w),
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
            child: CachedNetworkImage(
              imageUrl: 'http://${item.imageUrl}',
              fit: BoxFit.contain,
              height: 100.h,
              width: 145.w,
              placeholder: (context, url) => const MainLoadignWidget(),
            ),
            // child: SvgPicture.asset(
            //   'assets/image/svg/mackup.svg',
            // ),
            //  item.imageUrl != null
            // ? SvgPicture.network(
            //     item.imageUrl!,
            //   )
            // : SvgPicture.asset(
            //     'assets/image/svg/mackup.svg',
            //   ),
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
