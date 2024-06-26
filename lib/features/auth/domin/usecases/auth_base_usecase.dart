import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/req/create_account_request_entite.dart';
import '../entities/req/login_request_entite.dart';

abstract class AuthBaseUseCase {
  //? Base Use Case  Create Account :
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  });
  //? Base Use case Send Code
  Future<Either<Failure, Unit>> sendCode({
    required String phoneNum,
  });

  //? Base Use ConfirmAccount :
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  });

  //? Base Use Case Log In:
  Future<Either<Failure, Unit>> logIn({
    required LoginRequest request,
  });
}
