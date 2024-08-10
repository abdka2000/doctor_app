import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/req/create_account_request_entite.dart';
import '../entities/req/login_request_entite.dart';
import '../repository/auth_repository.dart';
import 'auth_base_usecase.dart';

class AuthUseCaseImpl implements AuthBaseUseCase {
  final AuthRepository repository;

  AuthUseCaseImpl({required this.repository});
  //? Use Case Crate Account :
  @override
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  }) async {
    return await repository.createAccount(request: request);
  }

//? Use Case confirm Account :
  @override
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    return await repository.confirmAccount(
      phoneNumber: phoneNumber,
      code: code,
    );
  }

  //? Use Case Log in :
  @override
  Future<Either<Failure, Unit>> logIn({
    required LoginRequest request,
  }) async {
    return await repository.logIn(request: request);
  }

  //? Use Case Send Code
  @override
  Future<Either<Failure, Unit>> sendCode({required String phoneNum}) async {
    return await repository.sendCode(phoneNum: phoneNum);
  }

  //? Use Caase Forgot Password
  @override
  Future<Either<Failure, Unit>> forgotPassword(
      {required String phoneNumber}) async {
    return await repository.forgotPassword(phoneNumber: phoneNumber);
  }

  //? Use Case Confirm Password
  @override
  Future<Either<Failure, Unit>> confirmForgotPassword(
      {required String phoneNumber, required String code}) async {
    return await repository.confirmForgotPassword(
        phoneNumber: phoneNumber, code: code);
  }

  //? Use Case Reset Passsword
  @override
  Future<Either<Failure, Unit>> resetPassword(
      {required String phoneNumber,
      required String code,
      required String newPassword}) async {
    return await repository.resetPassword(
      phoneNumber: phoneNumber,
      code: code,
      newPassword: newPassword,
    );
  }
}
