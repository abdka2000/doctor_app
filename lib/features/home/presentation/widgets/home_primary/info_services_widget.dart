// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/info_services_item.dart';
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
      height: 132.h,
      child: ListView.separated(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: items.length + 1,
        separatorBuilder: (context, index) => SizedBox(width: 25.w),
        itemBuilder: (context, index) {
          if (index == items.length && !hasReachedMax) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MainLoadignWidget(),
                SizedBox(
                  height: 20.h,
                )
              ],
            );
          } else if (index == items.length && hasReachedMax)
            return null;
          else
            return InfoServicesItem(item: items[index]);
        },
      ),
    );
  }
}
