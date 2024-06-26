import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class LabelTextSlider extends StatelessWidget {
  const LabelTextSlider({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextUtiels(
        text: name,
        paddingRight: 18.w,
        paddingTop: 5.h,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 20.sp,
            ),
      ),
    );
  }
}
