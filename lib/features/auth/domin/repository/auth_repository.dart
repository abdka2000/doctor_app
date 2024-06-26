import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/req/create_account_request_entite.dart';
import '../entities/req/login_request_entite.dart';

abstract class AuthRepository {
  //? Repository Login :
  Future<Either<Failure, Unit>> logIn({
    required LoginRequest request,
  });

  //? Repository for send cose:
  Future<Either<Failure, Unit>> sendCode({
    required String phoneNum,
  });

  //? Repository Create Account :
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  });

  //? Repository ConfirmAccount :
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  });
}
