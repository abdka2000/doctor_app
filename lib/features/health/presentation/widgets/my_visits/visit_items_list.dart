// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/item.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_visits/visit_item.dart';

class VisitItemsList extends StatelessWidget {
  const VisitItemsList({
    super.key,
    required this.items,
    required this.controller,
    required this.hasReachedMax,
  });
  final List<Item> items;
  final ScrollController controller;
  final bool hasReachedMax;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 320.w,
        child: ListView.separated(
          controller: controller,
          itemBuilder: (context, index) {
            if (index == items.length && !hasReachedMax) {
              return const MainLoadignWidget();
            } else if (index == items.length && hasReachedMax)
              return null;
            else
              return VisitItem(
                session: items[index],
              );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 30.h,
          ),
          itemCount: items.length + 1,
        ),
      ),
    );
  }
}
