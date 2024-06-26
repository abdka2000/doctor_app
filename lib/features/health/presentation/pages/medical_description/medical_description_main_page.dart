import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../widgets/medical_description/card_medical_description.dart';

class MidicalDesciptionPage extends StatelessWidget {
  const MidicalDesciptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Column(
        children: [
          TitlePageWidget(
            titleText: AppWordManger.medicalDescraption,
            onTap: () => Navigator.pop(context),
            paddingBottome: 40.h,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              itemCount: 5,
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
              itemBuilder: (context, index) {
                return const CardMedicalDescription();
              },
            ),
          )
        ],
      ),
    );
  }
}
