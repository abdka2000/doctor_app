import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import '../../../../core/widget/show_dialog/main_show_dialog_widget.dart';
import '../widgets/bacground_profile.dart';
import '../widgets/card_main_profile.dart';
import '../../../../router/app_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //? Button For Back :
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
        mainBody: SingleChildScrollView(
          child: Column(
            children: [
              //? Back Ground Profile :
              const BackGroundProfile(
                textBackGround: AppWordManger.profile,
                visibleIcon: false,
              ),
              //? Info Account :
              CardMainProfile(
                text: AppWordManger.infoAccount,
                paddingLeft: 125,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.infoProfileNameRoute,
                  );
                },
              ),
              //? Change Password :
              CardMainProfile(
                paddingLeft: 140,
                text: AppWordManger.changePassword,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.changePasswordNameRoute,
                  );
                },
              ),
              //? Edit Number :
              CardMainProfile(
                paddingLeft: 165,
                text: AppWordManger.updateMyNumber,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.editNumberNameRoute,
                  );
                },
              ),
              //? Delete My Account :
              CardMainProfile(
                paddingLeft: 160,
                text: AppWordManger.deleteAccount,
                onTap: () {
                  MainShowDialog.customShowDialog(
                    onTapBack: () {
                      Navigator.pop(context);
                    },
                    context,
                    firstButtonText: AppWordManger.yes,
                    secoundButtonText: AppWordManger.no,
                    textPopUp: AppWordManger.areYoueSureDeletedAccount,
                    onTapFirst: () => Navigator.pop(context),
                    onTapSecound: () => Navigator.pop(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
