import 'package:get_it/get_it.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/send_code/send_code_cubit.dart';
import 'package:hosptel_app/features/profile/data/data_sources/profile_remote.dart';
import 'package:hosptel_app/features/profile/data/repository/profile_repo_impl.dart';
import 'package:hosptel_app/features/profile/domain/repository/profile_repo.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profie_use_case.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_number/confirm_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_number/edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import '../core/network/network_info.dart';
import '../features/auth/data/datasources/local/auth_local.dart';
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
import '../features/home/presentation/cubit/adv/adv_cubit.dart';
import '../features/home/presentation/cubit/services/services_cubit.dart';
import '../features/reservation/data/data_sources/reservation_remote_data_source.dart';
import '../features/reservation/data/repository/reservations_repository.dart';
import '../features/reservation/domain/repository/reservation_repo.dart';
import '../features/reservation/domain/usecases/reservation_base_use_case.dart';
import '../features/reservation/domain/usecases/reservation_use_case.dart';
import '../features/reservation/presentation/cubit/days/days_cubit.dart';
import '../features/reservation/presentation/cubit/reservations/reservation_cubit.dart';
import '../features/reservation/presentation/cubit/times/time_today/times_cubit.dart';
import '../features/reservation/presentation/cubit/times/times_for_day/times_for_day_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features - Auth
//? Cubit

  sl.registerFactory(() => CreateAccountCubit(useCase: sl()));
  sl.registerFactory(() => ConfirmAccountCubit(useCase: sl()));
  sl.registerFactory(() => LoginCubit(useCase: sl()));
  sl.registerFactory(() => SendCodeCubit(sl()));
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
        local: sl(),
      ));
// DataSources
  //? Remote
  sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());
  //?
  //? Local
  sl.registerLazySingleton<AuthLocal>(() => AuthLocalImpl());
  //?
//! Features - Auth Finished

//? Features - Home
  //? Cubit
  sl.registerFactory<ServicesCubit>(() => ServicesCubit(sl()));
  sl.registerFactory<AdvCubit>(() => AdvCubit(sl()));
  //? Usecases
  sl.registerLazySingleton<HomeBaseUseCase>(() => HomeUseCaseImpl(sl()));
  //? Repo
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(reomte: sl()));

  //DataSources
  //?Remote
  sl.registerLazySingleton<HomeReomte>(() => HomeRemoteImpl());
//? Feature - Home Finished

//? Feature - Profile
  //? Cubit
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));
  sl.registerFactory<EditProfileCubit>(() => EditProfileCubit(sl()));
  sl.registerFactory<EditNumberCubit>(() => EditNumberCubit(sl()));
  sl.registerFactory<ConfirmEditNumberCubit>(() => ConfirmEditNumberCubit(sl()));
  sl.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(sl()));
  

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

//? Feature - Reservations
  //? Cubit
  sl.registerFactory<ReservationCubit>(() => ReservationCubit(sl()));
  sl.registerFactory<DaysCubit>(() => DaysCubit(sl()));
  sl.registerFactory<TimesCubit>(() => TimesCubit(sl()));
  sl.registerFactory<TimesForDayCubit>(() => TimesForDayCubit(sl()));
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

//? Features - Global
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplemntes(sl()),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
//! Features - Global Finished
}
