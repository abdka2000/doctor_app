import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/features/health/presentation/cubit/download_bloc/download_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/midical_sessions_bloc/midical_sessions_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/patient_files_bloc/patient_files_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/prescription_details_bloc/prescription_details_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_amount_bloc/user_amount_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_prescriptions_bloc/user_prescriptions_bloc.dart';

class HealthLogic {
  void midicalSessionListener(
    BuildContext context,
    MidicalSessionsState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.sessions.length < 5) {
        context.read<MidicalSessionsBloc>().add(const GetUserMidicalSessions());
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context
              .read<MidicalSessionsBloc>()
              .add(const GetUserMidicalSessions());
        }
      });
    }
  }

  void prescriptionDetailsListener(
    BuildContext context,
    PrescriptionDetailsState state,
    ScrollController controller,
    int id,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.prescriptionDetails.length < 5) {
        context
            .read<PrescriptionDetailsBloc>()
            .add(GetPrescriptionDetails(prescriptionId: id));
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context
              .read<PrescriptionDetailsBloc>()
              .add(GetPrescriptionDetails(prescriptionId: id));
        }
      });
    }
  }

  void userPrescriptionListener(
    BuildContext context,
    UserPrescriptionState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.userPrescriptions.length < 7) {
        context.read<UserPrescriptionsBloc>().add(const GetUserPrescriptions());
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context
              .read<UserPrescriptionsBloc>()
              .add(const GetUserPrescriptions());
        }
      });
    }
  }

  void patientFilesListener(
    BuildContext context,
    PatientFilesState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.files.length < 5) {
        context.read<PatientFilesBloc>().add(const GetUserFiles());
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<PatientFilesBloc>().add(const GetUserFiles());
        }
      });
    }
  }

  void patientAmountListener(
    BuildContext context,
    UserAmountState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.items.length < 5) {
        context.read<UserAmountBloc>().add(const GetUserAmount());
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<UserAmountBloc>().add(const GetUserAmount());
        }
      });
    }
  }

  void downloadFileListener(DownloadState state, BuildContext context) {
    if (state.status == DeafultBlocStatus.done) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      SnackBarUtil.showSnackBar(
          message: AppWordManger.doneFileDownlad,
          context: context,
          isSucces: true);
      Navigator.canPop(context) ? Navigator.pop(context) : null;
    } else if (state.status == DeafultBlocStatus.error) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      SnackBarUtil.showSnackBar(
        message: state.failureMessage.message,
        context: context,
      );

      Navigator.canPop(context) ? Navigator.pop(context) : null;
    } else if (state.status == DeafultBlocStatus.loading) {
      Navigator.pop(context);
      MainShowDialog.loadingDialog(context: context);
    }
  }
}
