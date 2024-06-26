import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.homeScreenNameRoute,
        );
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      child: MainBackGround(
        mainBody: Column(
          children: [
            //? Title Page Notifacation :
            const TitlePageWidget(
              titleText: AppWordManger.notifications,
            ),
            //? List From Api Notifications :
            Expanded(
              child: ListView.separated(
                physics: const ScrollPhysics(parent: null),
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
                itemBuilder: (context, index) {
                  return const InfoNotificationWidget();
                },
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
