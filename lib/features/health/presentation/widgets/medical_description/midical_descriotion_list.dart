// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/item.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/card_medical_description.dart';

class MidicalDescriptionsList extends StatelessWidget {
  const MidicalDescriptionsList({
    super.key,
    required this.items,
    required this.hasReachedMax,
    required this.controller,
  });
  final List<Item> items;
  final bool hasReachedMax;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: controller,
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        itemCount: items.length + 1,
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemBuilder: (context, index) {
          if (index == items.length && !hasReachedMax) {
            return const MainLoadignWidget();
          } else if (index == items.length && hasReachedMax)
            return null;
          else
            return CardMedicalDescription(
              id: items[index].id ?? 0,
            );
        },
      ),
    );
  }
}
