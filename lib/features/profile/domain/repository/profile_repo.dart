import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';

abstract class ProfileRepository {
  //? Repo Profile Data
  Future<Either<Failure, Person>> getProfileData();
  //? Repo Edit Profile
  Future<Either<Failure, Unit>> editProfile(Person person);
  //? Repo Edit Phone Number
  Future<Either<Failure, Unit>> editPhoneNumber(String phoneNumber);
  //? Repo Confirm Phone Number Edit
  Future<Either<Failure, Unit>> confirmEditPhoneNumber(
      String phoneNumber, String code);
  //? Repo Change Password
  Future<Either<Failure, Unit>> changePassword(
      String currentPassword, String newPassword);
  //? Repo Delete Account
  Future<Either<Failure, Unit>> deleteAccount();
  //? Repo Log Out
  Future<Either<Failure, Unit>> logOut();

}
