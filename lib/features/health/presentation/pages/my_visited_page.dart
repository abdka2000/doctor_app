import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/features/health/presentation/cubit/midical_sessions/midical_sessions_cubit.dart';
import 'package:hosptel_app/features/health/presentation/logic/health_logic.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_visits/not_found_my_visit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_visits/visit_items_list.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/titel_pages_widget.dart';

class MyVistsPage extends StatelessWidget {
  const MyVistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MidicalSessionsCubit>().getSessions(isRefresh: true);
      },
      child: MainBackGround(
        mainBody: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.myVisited,
              onTap: () => Navigator.pop(context),
            ),
            BlocConsumer<MidicalSessionsCubit, MidicalSessionsState>(
              listener: (context, state) {
                HealthLogic()
                    .midicalSessionListener(context, state, controller);
              },
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.done) {
                  if (state.sessions.isNotEmpty) {
                    return VisitItemsList(
                      items: state.sessions,
                      controller: controller,
                      hasReachedMax: state.hasReachedMax,
                    );
                  } else {
                    return const NotFoundMyVisit();
                  }
                } else if (state.status == DeafultBlocStatus.loading) {
                  return const MainLoadignWidget();
                }
                return ErrorTextWidget(
                  text: state.failureMessage.message,
                  onPressed: () =>
                      context.read<MidicalSessionsCubit>().getSessions(isRefresh: true),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
