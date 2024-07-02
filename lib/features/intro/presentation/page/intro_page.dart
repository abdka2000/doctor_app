import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/features/intro/presentation/cubit/navigate_cubit.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/png_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../widget/go_login_widget.dart';
import '../../../../router/app_router.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? back Ground Image :
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPngManger.backGroundIntro),
          ),
        ), //?
        child: Padding(
          padding: EdgeInsets.only(top: 250.w),
          child: Container(
            width: 390.w,
            height: 408.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.06.w, 1.10.h),
                end: Alignment(0.5.w, -2.8.h),
                colors: [
                  AppColorManger.black.withOpacity(0.6000000238418579),
                  AppColorManger.black.withOpacity(0.039000000804662704),
                  AppColorManger.black.withOpacity(0.0),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //? Text Word :
                TextUtiels(
                  text: AppWordManger.easyBookingExperience,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 24.sp,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: AppColorManger.black.withOpacity(0.25),
                        offset: const Offset(4, 0),
                      ),
                      Shadow(
                        blurRadius: 4,
                        color: AppColorManger.black.withOpacity(0.25),
                        offset: const Offset(4, 0),
                      ),
                    ],
                  ),
                ),

                TextUtiels(
                  text: AppWordManger.medicalAppointments,
                  paddingBottome: 17.5.h,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 24.sp,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: AppColorManger.black.withOpacity(0.25),
                        offset: const Offset(4, 0),
                      ),
                      Shadow(
                        blurRadius: 4,
                        color: AppColorManger.black.withOpacity(0.25),
                        offset: const Offset(4, 0),
                      ),
                    ],
                  ),
                ),

                TextUtiels(
                  text: AppWordManger
                      .bookYourAppointmentNowAndEnjoyAUniqueExperience,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: AppColorManger.black.withOpacity(0.25),
                      offset: const Offset(7, 0),
                    ),
                  ],
                ),

                TextUtiels(
                  text: AppWordManger.andSpecial,
                  paddingBottome: 40.h,
                ),
                //?
                //? Image For move to page Login :
                Row(
                  children: [
                    BlocListener<NavigateCubit, NavigateState>(
                      listener: (context, state) {
                        if (state is UnAuthinticateState) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteNamedScreens.loginScreenNameRoute,
                            (route) => false,
                          );
                        } else if (state is AuthinticateState) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteNamedScreens.homeScreenNameRoute,
                            (route) => false,
                          );
                        }
                      },
                      child: GoLoginImageWidget(
                        onTap: () {
                          //? navigation to login screen :
                          context.read<NavigateCubit>().checkAuth();

                          //? animation to show BottomSheet :
                          // AnimationController controller = AnimationController(
                          //   vsync: Navigator.of(context),
                          //   duration: const Duration(
                          //     seconds: 2,
                          //   ),
                          // );

                          // showModalBottomSheet(
                          //   isDismissible: false,
                          //   enableDrag: true,
                          //   transitionAnimationController: controller,
                          //   isScrollControlled: false,
                          //   context: context,
                          //   builder: (context) {
                          //     return const BottomeSheetWidget();
                          //   },
                          // );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 5.h,
                      ),
                      child: SvgPicture.asset(
                        width: 130.w,
                        height: 80.h,
                        AppSvgManger.arrowIntroPage,
                      ),
                    ),
                  ],
                ), //?
              ],
            ),
          ),
        ),
      ),
    );
  }
}
