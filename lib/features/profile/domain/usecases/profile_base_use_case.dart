import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';

abstract class ProfileBaseUseCase {
  Future<Either<Failure, Person>> getProfileData();
  Future<Either<Failure, Unit>> editProfile(Person person);
  Future<Either<Failure, Unit>> editPhoneNumber(String phoneNumber);
  Future<Either<Failure, Unit>> confirmEditPhoneNumber(
      String phoneNumber, String code);
  Future<Either<Failure, Unit>> changePassword(
      String currentPassword, String newPassword);
  Future<Either<Failure, Unit>> deleteAccount();
}
