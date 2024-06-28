import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/presentation/cubit/midical_sessions/midical_sessions_cubit.dart';

class HealthLogic {
  midicalSessionListener(
    BuildContext context,
    MidicalSessionsState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      controller.addListener(() {
        if (controller.offset == controller.position.maxScrollExtent) {
          context.read<MidicalSessionsCubit>().getSessions();
        }
      });
    }
  }
}
