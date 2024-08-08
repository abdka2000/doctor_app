import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/check_net.dart';
import '../../../../core/shared/shared_pref.dart';
import '../datasources/remote/auth_remote.dart';
import '../../domin/entities/req/create_account_request_entite.dart';
import '../../domin/entities/req/login_request_entite.dart';
import '../../domin/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote remote;

  AuthRepositoryImpl({required this.remote});
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
  Future<Either<Failure, bool>> logIn({required LoginRequest request}) async {
    return CheckNet<bool>().checkNetResponse(
      tryRight: () async {
        final data = await remote.logIn(request: request);
        String token = "Bearer ${data.result!.accessToken}";
        AppSharedPreferences.clear();
        AppSharedPreferences.cashToke(token: token);
        final isConfirmed = data.details == "True" ? false : true;
        return Right(isConfirmed);
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

  @override
  Future<Either<Failure, Unit>> confirmForgotPassword(
      {required String phoneNumber, required String code}) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.confirmForgetPassword(
          phoneNumber: phoneNumber, code: code);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(
      {required String phoneNumber}) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.forgotPassword(phoneNumber: phoneNumber);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
      {required String phoneNumber,
      required String code,
      required String newPassword}) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.resetPassword(
          phoneNumber: phoneNumber, code: code, password: newPassword);
      return Right(data);
    });
  }
}
