import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/item.dart';
import 'package:intl/intl.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';

class InfoMyFileWidget extends StatelessWidget {
  const InfoMyFileWidget({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //? Dowanload Icon :
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: SvgPicture.asset(
            width: 41.w,
            height: 41.h,
            AppSvgManger.iconDowanload,
          ),
        ),
        //? Ifno File :
        Container(
          width: 150.w,
          padding: EdgeInsets.only(left: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtiels(
                text: item.fileName ?? '',
                paddingBottome: 3.h,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(
                width: 130.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtiels(
                        text: DateFormat.jm()
                            .format(item.creationTime ?? DateTime.now()),
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 10.sp,
                                ),
                      ),
                      TextUtiels(
                        text: DateFormat('yyyy/MM/dd')
                            .format(item.creationTime ?? DateTime.now()),
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 10.sp,
                                ),
                      ),
                      TextUtiels(
                        text: '${item.fileSize} kB',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 10.sp,
                                ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //? Icon File Or Image :
        SvgPicture.asset(
          width: 70.w,
          height: 70.h,
          AppSvgManger.iconFile,
        ),
      ],
    );
  }
}
