import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/check_net.dart';
import '../../../../core/shared/shared_pref.dart';
import '../datasources/local/auth_local.dart';
import '../datasources/remote/auth_remote.dart';
import '../../domin/entities/req/create_account_request_entite.dart';
import '../../domin/entities/req/login_request_entite.dart';
import '../../domin/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote remote;
  final AuthLocal local;

  AuthRepositoryImpl({required this.remote, required this.local});
  //?  Create Account Repository Impl :
  @override
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.createAccount(request: request);
        return Right(data);
      },
    );
  }

//? Confirm Account Repository Impl :
  @override
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.confirmAccount(
          phoneNumber: phoneNumber,
          code: code,
        );
        return Right(data);
      },
    );
  }
  //? Log in Repository Impl :

  @override
  Future<Either<Failure, Unit>> logIn({required LoginRequest request}) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.logIn(request: request);
        String token = "Bearer ${data.result!.accessToken}";
        AppSharedPreferences.clear();
        AppSharedPreferences.cashToke(token: token);
        return const Right(unit);
      },
    );
  }

  //? Send Code Repo Impl
  @override
  Future<Either<Failure, Unit>> sendCode({required String phoneNum}) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.sendCode(phoneNum: phoneNum);
      return Right(data);
    });
  }
}
