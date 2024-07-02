import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/info_profile_page_body.dart';

class InfoProfilePage extends StatelessWidget {
  const InfoProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.status == DeafultBlocStatus.done) {
            return InfoProfilePageBody(person: state.person);
          } else if (state.status == DeafultBlocStatus.loading) {
            return const Scaffold(body: MainLoadignWidget());
          }
          return Scaffold(
              body: ErrorTextWidget(
            text: state.failureMessage.message,
            onPressed: () => context.read<ProfileCubit>().getPersonData(),
          ));
        },
      ),
    );
  }
}
