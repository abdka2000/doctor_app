import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/send_code/send_code_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/midical_sessions/midical_sessions_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_number/confirm_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_number/edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import '../core/shared/shared_pref.dart';
import '../features/auth/presentation/cubit/confirm_account/confirm_account_cubit.dart';
import '../features/auth/presentation/cubit/create_Account/create_account_cubit.dart';
import '../features/auth/presentation/cubit/login/login_cubit.dart';
import '../features/auth/presentation/pages/confirm_forget_password_page.dart';
import '../features/health/presentation/pages/medical_description/medical_description_main_page.dart';
import '../features/health/presentation/pages/medical_description/medical_description_table.dart';
import '../features/health/presentation/pages/mony_account.dart';
import '../features/health/presentation/pages/my_file_page.dart';
import '../features/health/presentation/pages/my_visited_page.dart';
import '../features/auth/presentation/pages/forget_password.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/confrim_number_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/health/presentation/pages/health_page.dart';
import '../features/home/presentation/cubit/adv/adv_cubit.dart';
import '../features/home/presentation/cubit/services/services_cubit.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/home_secoundry.dart';
import '../features/intro/presentation/page/intro_page.dart';
import '../features/notification/presentation/pages/notification_page.dart';
import '../features/profile/presentation/pages/change_password_page.dart';
import '../features/profile/presentation/pages/edit_number_page.dart';
import '../features/profile/presentation/pages/info_profile_page.dart';
import '../features/profile/presentation/pages/main_profile_page.dart';
import '../features/profile/presentation/pages/verification_edit_number.dart';
import '../features/reservation/presentation/cubit/days/days_cubit.dart';
import '../features/reservation/presentation/cubit/times/time_today/times_cubit.dart';
import '../features/reservation/presentation/cubit/times/times_for_day/times_for_day_cubit.dart';
import '../features/reservation/presentation/pages/my_reservation/reservation_page.dart';
import '../features/reservation/presentation/pages/reservation_now/details_reservation_page.dart';
import '../features/reservation/presentation/pages/reservation_now/summary_reservation.dart';
import '../injection/injection_container.dart' as di;

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      //! Start Feature Intro //! :
      //? Start Intro Page :
      case RouteNamedScreens.introScreenNameRoute:
        // if (AppSharedPreferences.getToken().isEmpty) {
        return MaterialPageRoute(
          builder: (_) => const IntroPage(),
        ); //? End Intro Page
      // } else {
      //   return MaterialPageRoute(builder: (_) => const HomePage());
      // }
      //! End Feature Intro //! :

      //! Start Feature Auth //! :
      //? Start Login Screen:
      case RouteNamedScreens.loginScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<LoginCubit>(),
              child: const LoginScreen(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Login Screen
      //? Start SignUp Screen:
      case RouteNamedScreens.signUpScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<CreateAccountCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<SendCodeCubit>(),
                ),
              ],
              child: const SignUpPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End SignUp Screen:

      //? Start Forget Password  Screen:
      case RouteNamedScreens.forgetPasswordPage:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ForgetPasswordPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Forget Password Screen:
      //? Start Forget Password Verification Code  Screen:
      case RouteNamedScreens.forgetPasswordVerificationCodeScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ConfirmFrogetPassword();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Forget Password Screen:

      //? Start Verificatio for Number :
      case RouteNamedScreens.reciveNumberVerificationPageScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final phoneNumber = arguments as String;
            return BlocProvider(
              create: (context) => di.sl<ConfirmAccountCubit>(),
              child: ConfirmPhoneNumberPage(
                phoneNumber: phoneNumber,
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Forget Verificatio for Number:

      //! End Feature Auth //! :
      //? Start Home Screen:
      case RouteNamedScreens.homeScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => di.sl<ServicesCubit>()..getServices()),
                BlocProvider(create: (context) => di.sl<AdvCubit>()..getAdvs()),
              ],
              child: const HomePage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Home Screen:
      case RouteNamedScreens.homeSecoundryScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomeSecoundryPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Home Screen:
      //! Start Feature HeaLth :
      //? Start Health Screen:
      case RouteNamedScreens.healthNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HealthPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Health Screen
      //? Start My Visit Page :
      case RouteNamedScreens.myVisitNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<MidicalSessionsCubit>()..getSessions(),
              child: const MyVistsPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      //? End My Visit Page :
      //? Start My File Page :
      case RouteNamedScreens.myFileNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MyFilePage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End My File Page :

      //? Start MidicalDesciption Page :
      case RouteNamedScreens.midicalDesciptionNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MidicalDesciptionPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End MidicalDesciption Page :
      //? Start Midical Desciption Table Page :
      case RouteNamedScreens.midicalDesciptionTableNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MedicalDescriptionTablePage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End MidicalDesciption Table Page :

      //? Start Mony Account Page :
      case RouteNamedScreens.monyAccountNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MonyAccountPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Mony Account Page :
      //! End Feature Health
      //? Start Notification Screen:
      case RouteNamedScreens.notificationNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const NotificationPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Notification Screen
      //! Start Feature Reservation :
      //? Start Reservation Page :
      case RouteNamedScreens.reservationNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ReservationPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Reservation Screen
      //? Start Reservation Details :
      case RouteNamedScreens.reservationDetailsNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<DaysCubit>()..getDays(),
                ),
                BlocProvider(
                  create: (context) => di.sl<TimesCubit>()..getTodaysTimes(),
                ),
                BlocProvider(
                  create: (context) => di.sl<TimesForDayCubit>()..getTimes(),
                )
              ],
              child: const DetailesReservationPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Reservation Details Screen
      //? Start Reservation Summary Screen
      case RouteNamedScreens.reservationSummaryNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SummaryReservationPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Reservation Summary Screen
      //! End Feature Reservation
      //? Start  Profile Page :
      case RouteNamedScreens.profileNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ProfilePage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Profile page
      //? Start Profile Info Page :
      case RouteNamedScreens.infoProfileNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<ProfileCubit>()..getPersonData(),
                ),
                BlocProvider(
                  create: (context) => di.sl<EditProfileCubit>(),
                ),
              ],
              child: const InfoProfilePage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Profile Info Screen
      //? Start Change Password Page :
      case RouteNamedScreens.changePasswordNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<ChangePasswordCubit>(),
              child: const ChangePasswordPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Change Password Page :
      //? Start Edit Number Page :
      case RouteNamedScreens.editNumberNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<EditNumberCubit>(),
              child: const EditNumberPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Edit Number Page :

      //? Start Verfication Edit Number Page :
      case RouteNamedScreens.verificationEditNumberNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final phoneNumber = arguments as String;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<ConfirmEditNumberCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<EditNumberCubit>(),
                ),
              ],
              child: VerficationEditNumber(phoneNumber: phoneNumber),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Verfication Edit Number Page :
    }

    return null;
  }
}

class RouteNamedScreens {
  //! Routing Naming
  static const introScreenNameRoute = '/';

  //? Start Auth Feature :
  static const loginScreenNameRoute = '/login-screen';
  static const signUpScreenNameRoute = '/signUp-screen';
  static const forgetPasswordVerificationCodeScreenNameRoute =
      '/forget-password-verification-screen';
  static const forgetPasswordPage = '/forget-password-screen';
  static const reciveNumberVerificationPageScreenNameRoute =
      '/verification-number-screen';
  //? End Auth Feature :
  //? Strart Home Feature :
  static const homeScreenNameRoute = '/home-screen';
  static const homeSecoundryScreenNameRoute = '/home-secoundry-screen';
  //? End Home Feature :
  //? Start Health Feature :
  static const healthNameRoute = '/health-screen';
  static const myVisitNameRoute = '/myVisit-screen';
  static const myFileNameRoute = '/myFile-screen';
  static const midicalDesciptionNameRoute = '/medical-description-screen';
  static const midicalDesciptionTableNameRoute =
      '/medical-description-table-screen';
  static const monyAccountNameRoute = '/mony-account-screen';
  //? End Health Feature :

  static const notificationNameRoute = '/notification-screen';

  //? Start Feature Reservation :
  static const reservationNameRoute = '/reservation-screen';
  static const reservationDetailsNameRoute = '/reservation-reservation-screen';
  static const reservationSummaryNameRoute = '/reservation-summary-screen';
  //? End Feature Reservation

  //? Start Profile Feature :
  static const profileNameRoute = '/profile-screen';
  static const infoProfileNameRoute = '/info-profile-screen';
  static const changePasswordNameRoute = '/change-password-screen';
  static const editNumberNameRoute = '/edit-number-screen';
  static const verificationEditNumberNameRoute = '/verification-edit-screen';
  //? End Profile Feature :
  //!
}
