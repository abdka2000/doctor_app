import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/presentation/cubit/midical_sessions/midical_sessions_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/patient_files/patient_files_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/prescription_details/prescription_details_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_amount/user_amount_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_prescription/user_prescriptions_cubit.dart';

class HealthLogic {
  void midicalSessionListener(
    BuildContext context,
    MidicalSessionsState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.sessions.length < 6) {
        context.read<MidicalSessionsCubit>().getSessions();
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<MidicalSessionsCubit>().getSessions();
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
      if (state.prescriptionDetails.length < 6) {
        context
            .read<PrescriptionDetailsCubit>()
            .getPrescriptionDetails(prescriptionId: id);
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context
              .read<PrescriptionDetailsCubit>()
              .getPrescriptionDetails(prescriptionId: id);
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
        context.read<UserPrescriptionsCubit>().getUserPrescriptions();
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<UserPrescriptionsCubit>().getUserPrescriptions();
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
      if (state.files.length < 6) {
        context.read<PatientFilesCubit>().getPatientFiles();
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<PatientFilesCubit>().getPatientFiles();
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
        context.read<UserAmountCubit>().getUserAmount();
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<UserAmountCubit>().getUserAmount();
        }
      });
    }
  }
}
