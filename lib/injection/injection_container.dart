import 'package:get_it/get_it.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/send_code/send_code_cubit.dart';
import 'package:hosptel_app/features/health/data/data_sources/heath_remote.dart';
import 'package:hosptel_app/features/health/data/repository/health_repo_impl.dart';
import 'package:hosptel_app/features/health/domain/repository/health_repo.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_use_case.dart';
import 'package:hosptel_app/features/health/presentation/cubit/download_bloc/download_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/midical_sessions_bloc/midical_sessions_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/patient_files_bloc/patient_files_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/prescription_details_bloc/prescription_details_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_amount_bloc/user_amount_bloc.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_prescriptions_bloc/user_prescriptions_bloc.dart';
import 'package:hosptel_app/features/home/presentation/cubit/doctor_info/doctor_info_cubit.dart';
import 'package:hosptel_app/features/home/presentation/cubit/services_bloc/services_bloc.dart';
import 'package:hosptel_app/features/intro/presentation/cubit/navigate_cubit.dart';
import 'package:hosptel_app/features/notification/data/data_sources/notifications_remote.dart';
import 'package:hosptel_app/features/notification/data/repository/notifications_repo_impl.dart';
import 'package:hosptel_app/features/notification/domain/repository/notifications_repository.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notifications_base_use_case.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notifications_use_case.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/notifications_bloc/notifications_bloc.dart';
import 'package:hosptel_app/features/profile/data/data_sources/profile_remote.dart';
import 'package:hosptel_app/features/profile/data/repository/profile_repo_impl.dart';
import 'package:hosptel_app/features/profile/domain/repository/profile_repo.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profie_use_case.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_number/confirm_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/delete_account/delete_account_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_number/edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/log_out/log_out_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/create_appoinment/create_appoinment_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/info_days_times/info_days_times_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/reservations_bloc/reservations_bloc.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/symptoms_bloc/symptoms_bloc.dart';
import '../core/network/network_info.dart';
import '../features/auth/data/datasources/remote/auth_remote.dart';
import '../features/auth/data/repository/auth_repository_impl.dart';
import '../features/auth/domin/repository/auth_repository.dart';
import '../features/auth/domin/usecases/auth_base_usecase.dart';
import '../features/auth/domin/usecases/auth_usecase.dart';
import '../features/auth/presentation/cubit/confirm_account/confirm_account_cubit.dart';
import '../features/auth/presentation/cubit/create_Account/create_account_cubit.dart';
import '../features/auth/presentation/cubit/login/login_cubit.dart';
import '../features/home/data/datasource/remote/home_remote.dart';
import '../features/home/data/repository/home_repository_impl.dart';
import '../features/home/domain/repository/home_repository.dart';
import '../features/home/domain/usecases/home_base_usecase.dart';
import '../features/home/domain/usecases/home_usecase.dart';
import '../features/home/presentation/cubit/advertisement/advertisement_cubit.dart';
import '../features/reservation/data/data_sources/reservation_remote_data_source.dart';
import '../features/reservation/data/repository/reservations_repository.dart';
import '../features/reservation/domain/repository/reservation_repo.dart';
import '../features/reservation/domain/usecases/reservation_base_use_case.dart';
import '../features/reservation/domain/usecases/reservation_use_case.dart';
import '../features/reservation/presentation/cubit/days/days_cubit.dart';
import '../features/reservation/presentation/cubit/times_for_day/times_for_day_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features - Intro
  //? Cubit
  sl.registerFactory(() => NavigateCubit());
//! Features - Intro Finished
//! Features - Auth
//? Cubit

  sl.registerFactory(() => CreateAccountCubit(useCase: sl()));
  sl.registerFactory(() => ConfirmAccountCubit(useCase: sl()));
  sl.registerFactory(() => LoginCubit(useCase: sl()));
  sl.registerFactory(() => SendCodeCubit(sl()));
  sl.registerFactory(() => ForgetPasswordCubit(sl()));
//?
//? Usecase
  sl.registerLazySingleton<AuthBaseUseCase>(
    () => AuthUseCaseImpl(
      repository: sl(),
    ),
  );
//?
//? Repo
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remote: sl(),
      ));
// DataSources
  //? Remote
  sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());
  //?
//! Features - Auth Finished

//? Features - Home
  //? Cubit
  sl.registerFactory<ServicesBloc>(() => ServicesBloc(sl()));
  sl.registerFactory<AdvertisementCubit>(() => AdvertisementCubit(sl()));
  sl.registerFactory<DoctorInfoCubit>(() => DoctorInfoCubit(sl()));

  //? Usecases
  sl.registerLazySingleton<HomeBaseUseCase>(() => HomeUseCaseImpl(sl()));

  //? Repo
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remote: sl()));

  //DataSources
  //?Remote
  sl.registerLazySingleton<HomeReomte>(() => HomeRemoteImpl());
//? Feature - Home Finished

//? Feature - Profile
  //? Cubit
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));
  sl.registerFactory<EditProfileCubit>(() => EditProfileCubit(sl()));
  sl.registerFactory<EditNumberCubit>(() => EditNumberCubit(sl()));
  sl.registerFactory<ConfirmEditNumberCubit>(
      () => ConfirmEditNumberCubit(sl()));
  sl.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(sl()));
  sl.registerFactory<DeleteAccountCubit>(() => DeleteAccountCubit(sl()));
  sl.registerFactory<LogOutCubit>(() => LogOutCubit(sl()));

  //? Use Cases
  sl.registerLazySingleton<ProfileBaseUseCase>(
      () => ProfileUseCase(repo: sl()));

  //? Repo
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepoImpl(remote: sl()));

  //? Data source
  //? Remote
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl());

//? Feature Profile Finished

//? Feature Health
  //? Cubit
  sl.registerFactory<MidicalSessionsBloc>(() => MidicalSessionsBloc(sl()));
  sl.registerFactory<PrescriptionDetailsBloc>(
      () => PrescriptionDetailsBloc(sl()));
  sl.registerFactory<UserPrescriptionsBloc>(() => UserPrescriptionsBloc(sl()));
  sl.registerFactory<UserAmountBloc>(() => UserAmountBloc(sl()));
  sl.registerFactory<PatientFilesBloc>(() => PatientFilesBloc(sl()));
  sl.registerFactory<DownloadBloc>(() => DownloadBloc(sl()));

  //? Use Cases
  sl.registerLazySingleton<HealthBaseUseCase>(() => HealthUseCase(sl()));

  //? Repo
  sl.registerLazySingleton<HealthRepo>(() => HealthRepoImpl(remote: sl()));
  //? Remote Data Source
  sl.registerLazySingleton<HealthRemote>(() => HealthRemoteImpl());

//? Feature - Reservations
  //? Cubit
  sl.registerFactory<DaysCubit>(() => DaysCubit(sl()));
  sl.registerFactory<InfoDaysTimesCubit>(() => InfoDaysTimesCubit(sl()));
  sl.registerFactory<TimesForDayCubit>(() => TimesForDayCubit(sl()));
  sl.registerFactory<SymptomsBloc>(() => SymptomsBloc(sl()));
  sl.registerFactory<CreateAppoinmentCubit>(() => CreateAppoinmentCubit(sl()));
  sl.registerFactory<ReservationsBloc>(() => ReservationsBloc(sl()));

  //?Usecases
  sl.registerLazySingleton<ReservationBaseUseCase>(
      () => ReservationUseCaseImpl(repo: sl()));
  //?Repo
  sl.registerLazySingleton<ReservationRepository>(
      () => ReservationRepoImpl(remoteDataSource: sl()));
  //? Data sources
  //? Remote
  sl.registerLazySingleton<ReservationRemoteDataSource>(
      () => ReservationRemoteDataSourceImpl());
//? End Features - reservations

//? Featuser - Notifications
  //? Cubit - Bloc
  sl.registerFactory(() => NotificationsBloc(sl()));

  //? Use Cases
  sl.registerLazySingleton<NotificationsBaseUseCase>(
      () => NotificationsUseCase(repo: sl()));

  //? Repo
  sl.registerLazySingleton<NotificationsRepo>(
      () => NotificationsRepoImpl(remote: sl()));

  //? Remote
  sl.registerLazySingleton<NotificationsRemote>(
      () => NotificationsRemoteImpl());

//? Features - Global
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplemntes(sl()),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
//! Features - Global Finished
}
