import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';
import 'package:hosptel_app/features/profile/domain/repository/profile_repo.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';

class ProfileUseCase implements ProfileBaseUseCase {
  final ProfileRepository repo;

  ProfileUseCase({required this.repo});
  @override
  Future<Either<Failure, Person>> getProfileData() async {
    return await repo.getProfileData();
  }

  @override
  Future<Either<Failure, Unit>> editProfile(Person person) async {
    return await repo.editProfile(person);
  }

  @override
  Future<Either<Failure, Unit>> editPhoneNumber(String phoneNumber) async {
    return await repo.editPhoneNumber(phoneNumber);
  }

  @override
  Future<Either<Failure, Unit>> confirmEditPhoneNumber(
      String phoneNumber, String code) async {
    return await repo.confirmEditPhoneNumber(phoneNumber, code);
  }

  @override
  Future<Either<Failure, Unit>> changePassword(
      String currentPassword, String newPassword) async {
    return await repo.changePassword(currentPassword, newPassword);
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    return await repo.deleteAccount();
  }
}
