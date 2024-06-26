import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widget/text_utiles/text_utile_widget.dart';

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget({
    super.key,
    required this.text,
    required this.paddingTop,
    required this.paddingRight,
    this.paddingBottome,
  });
  final String text;
  final double paddingTop;
  final double paddingRight;
  final double? paddingBottome;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextUtiels(
        text: text,
        paddingTop: paddingTop,
        paddingRight: paddingRight,
        paddingBottome: paddingBottome,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 20.sp,
            ),
      ),
    );
  }
}
