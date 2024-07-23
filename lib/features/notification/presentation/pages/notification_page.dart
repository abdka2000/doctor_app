import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/item.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/notifications_bloc/notifications_bloc.dart';
import 'package:hosptel_app/features/notification/presentation/logic/notifications_logic.dart';
import 'package:hosptel_app/features/notification/presentation/widgets/emty_info_notification.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import '../../../../core/widget/repeted/titel_pages_widget.dart';
import '../widgets/info_notification.dart';
import '../../../../router/app_router.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.homeScreenNameRoute,
        );
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      child: RefreshIndicator(
        onRefresh: () async {
          context
              .read<NotificationsBloc>()
              .add(const GetNotifications(isRefresh: true));
        },
        child: MainBackGround(
          mainBody: Column(
            children: [
              //? Title Page Notifacation :
              const TitlePageWidget(
                titleText: AppWordManger.notifications,
              ),
              //? List From Api Notifications :
              BlocConsumer<NotificationsBloc, NotificationsState>(
                listener: (context, state) {
                  NotificationsLogic()
                      .notificationsListener(context, state, controller);
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.done) {
                    if (state.notifications.isEmpty) {
                      return const EmptyInfoNotification();
                    } else {
                      return NotificationsList(
                        controller: controller,
                        hasReachedMax: state.hasReachedMax,
                        items: state.notifications,
                      );
                    }
                  } else if (state.status == DeafultBlocStatus.error) {
                    return ErrorTextWidget(
                      text: state.failureMessage.message,
                      onPressed: () {
                        context
                            .read<NotificationsBloc>()
                            .add(const GetNotifications(isRefresh: true));
                      },
                      isScrollable: true,
                    );
                  }
                  return const MainLoadignWidget();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsList extends StatelessWidget {
  final ScrollController controller;
  final bool hasReachedMax;
  final List<Item> items;
  const NotificationsList({
    super.key,
    required this.controller,
    required this.hasReachedMax,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        // controller: controller,
        physics: const ScrollPhysics(parent: null),
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
        itemBuilder: (context, index) {
          if (index == items.length && !hasReachedMax) {
            return const MainLoadignWidget();
          } else if (index == items.length && hasReachedMax) {
            return null;
          } else {
            return InfoNotificationWidget(item: items[index]);
          }
        },
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: 6,
      ),
    );
  }
}
