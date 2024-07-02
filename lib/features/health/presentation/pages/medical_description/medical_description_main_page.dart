import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/item.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_prescription/user_prescriptions_cubit.dart';
import 'package:hosptel_app/features/health/presentation/logic/health_logic.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/empty_medical_description.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/midical_descriotion_list.dart';
import '../../../../../core/resources/word_manger.dart';
import '../../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../widgets/medical_description/card_medical_description.dart';

class MidicalDesciptionPage extends StatelessWidget {
  const MidicalDesciptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return MainBackGround(
      mainBody: Column(
        children: [
          TitlePageWidget(
            titleText: AppWordManger.medicalDescraption,
            onTap: () => Navigator.pop(context),
            paddingBottome: 40.h,
          ),
          BlocConsumer<UserPrescriptionsCubit, UserPrescriptionState>(
            listener: (context, state) {
              HealthLogic()
                  .userPrescriptionListener(context, state, controller);
            },
            builder: (context, state) {
              if (state.status == DeafultBlocStatus.done) {
                if (state.userPrescriptions.isEmpty) {
                  return const EmptyMedicalDesciption();
                } else {
                  return MidicalDescriptionsList(
                    controller: controller,
                    hasReachedMax: state.hasReachedMax,
                    items: state.userPrescriptions,
                  );
                }
              } else if (state.status == DeafultBlocStatus.loading) {
                return const MainLoadignWidget();
              }
              return ErrorTextWidget(
                  text: state.failureMessage.message,
                  onPressed: () {
                    context
                        .read<UserPrescriptionsCubit>()
                        .getUserPrescriptions();
                  });
            },
          )
        ],
      ),
    );
  }
}
