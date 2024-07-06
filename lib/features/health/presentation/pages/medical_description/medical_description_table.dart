// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/features/health/presentation/cubit/prescription_details/prescription_details_cubit.dart';
import 'package:hosptel_app/features/health/presentation/logic/health_logic.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/empty_medical_description.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/medical_description_list.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/repeted/titel_pages_widget.dart';

class MedicalDescriptionTablePage extends StatelessWidget {
  const MedicalDescriptionTablePage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<PrescriptionDetailsCubit>()
            .getPrescriptionDetails(prescriptionId: id);
      },
      child: MainBackGround(
        mainBody: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.medicalDescraption,
              onTap: () => Navigator.pop(context),
              paddingBottome: 40.h,
            ),
            BlocConsumer<PrescriptionDetailsCubit, PrescriptionDetailsState>(
              listener: (context, state) {
                HealthLogic().prescriptionDetailsListener(
                    context, state, controller, id);
              },
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading) {
                  return const MainLoadignWidget();
                } else if (state.status == DeafultBlocStatus.done) {
                  if (state.prescriptionDetails.isEmpty) {
                    return const EmptyMedicalDesciption();
                  } else {
                    return MidicalTableBody(
                      controller: controller,
                      hasReachedMax: state.hasReachedMax,
                      items: state.prescriptionDetails ?? [],
                    );
                  }
                }
                return ErrorTextWidget(
                    text: state.failureMessage.message,
                    onPressed: () {
                      context
                          .read<PrescriptionDetailsCubit>()
                          .getPrescriptionDetails(prescriptionId: id);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
