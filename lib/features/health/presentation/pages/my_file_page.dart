// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/item.dart';
import 'package:hosptel_app/features/health/presentation/cubit/patient_files_bloc/patient_files_bloc.dart';
import 'package:hosptel_app/features/health/presentation/logic/health_logic.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_files/empty_my_file.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/titel_pages_widget.dart';
import '../widgets/my_files/info_my_file.dart';

class MyFilePage extends StatelessWidget {
  const MyFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<PatientFilesBloc>()
            .add(const GetUserFiles(isRefresh: true));
      },
      child: MainBackGround(
        mainBody: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.myFiles,
              onTap: () => Navigator.pop(context),
            ),
            //? Info List My File :
            BlocConsumer<PatientFilesBloc, PatientFilesState>(
              listener: (context, state) {
                HealthLogic().patientFilesListener(context, state, controller);
              },
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.done) {
                  if (state.files.isNotEmpty) {
                    return MyFilesList(
                      hasReachedMax: state.hasReachedMax,
                      controller: controller,
                      items: state.files,
                    );
                  } else {
                    return const EmptyMyFileWidget();
                  }
                } else if (state.status == DeafultBlocStatus.loading) {
                  return const MainLoadignWidget();
                }
                return ErrorTextWidget(
                    text: state.failureMessage.message,
                    onPressed: () {
                      context
                          .read<PatientFilesBloc>()
                          .add(const GetUserFiles(isRefresh: true));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyFilesList extends StatelessWidget {
  const MyFilesList({
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
      child: ListView.separated(
        controller: controller,
        itemCount: items.length + 1,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        itemBuilder: (context, index) {
          if (index == items.length && !hasReachedMax)
            return const MainLoadignWidget();
          else if (index == items.length && hasReachedMax) return null;
          return Container(
            width: 320.w,
            height: 145.h,
            decoration: BoxDecoration(
              color: AppColorManger.fillColorCard,
              border: Border.all(
                color: AppColorManger.primaryColor,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: InfoMyFileWidget(item: items[index]),
          );
        },
      ),
    );
  }
}
