import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/home/presentation/cubit/services_bloc/services_bloc.dart';

class HomeLogic {
  servicesListener(
    BuildContext context,
    ServicesState state,
    ScrollController controller,
  ) {
    if (state.status == DeafultBlocStatus.done && !state.hasReachedMax) {
      if (state.services.length < 5) {
        context.read<ServicesBloc>().add(const GetServices());
      }
      controller.addListener(() {
        if (controller.offset >= (controller.position.maxScrollExtent * 0.8)) {
          context.read<ServicesBloc>().add(const GetServices());
        }
      });
    }
  }
}
