// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/info_services_item.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../../../domain/entity/doctor_services/item_entity.dart';

class InfoServicesWidget extends StatelessWidget {
  const InfoServicesWidget(
      {super.key,
      required this.items,
      required this.hasReachedMax,
      required this.controller});
  final List<Item> items;
  final bool hasReachedMax;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        // itemCount: 5,
        itemCount: items.length +1,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          if (index == items.length && !hasReachedMax) {
            return const MainLoadignWidget();
          } else if (index == items.length && hasReachedMax)
            return null;
          else
            return InfoServicesItem(item: items[index]);
        },
      ),
    );
  }
}
