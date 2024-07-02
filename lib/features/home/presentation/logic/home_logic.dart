import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/home/presentation/cubit/services/services_cubit.dart';

class HomeLogic {
  servicesListener(
    BuildContext context,
    ServicesState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.services.length < 3) {
        context.read<ServicesCubit>().getServices();
      }
      controller.addListener(() {
        if (controller.offset == controller.position.maxScrollExtent) {
          context.read<ServicesCubit>().getServices();
        }
      });
    }
  }
}
