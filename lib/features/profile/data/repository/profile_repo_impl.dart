import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/profile/data/data_sources/profile_remote.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';
import 'package:hosptel_app/features/profile/domain/repository/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepoImpl({required this.remote});
  @override
  Future<Either<Failure, Person>> getProfileData() async {
    return CheckNet<Person>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getProfileData();
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> editProfile(Person person) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.editProfile(person);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> confirmEditPhoneNumber(
      String phoneNumber, String code) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.confirmEditPhoneNumber(phoneNumber, code);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> editPhoneNumber(String phoneNumber) {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.editPhoneNumber(phoneNumber);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> changePassword(
      String currentPassword, String newPassword) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.changePassword(currentPassword, newPassword);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.deleteAccount();
      AppSharedPreferences.clear();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.logOut();
      return Right(data);
    });
  }
}
