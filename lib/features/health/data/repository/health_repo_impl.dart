import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/health/data/data_sources/heath_remote.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/domain/entities/patient_files_entity/patient_files_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/prescription_details_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';
import 'package:hosptel_app/features/health/domain/repository/health_repo.dart';

class HealthRepoImpl implements HealthRepo {
  final HealthRemote remote;

  HealthRepoImpl({required this.remote});
  @override
  Future<Either<Failure, List<MidicalSession>>> getMidicalSession(
      {required int skipCount, required int maxResult}) async {
    return CheckNet<List<MidicalSession>>().checkNetResponse(
        tryRight: () async {
      final data = await remote.getMidicalSessions(
          maxResult: maxResult, skipCount: skipCount);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, PrescriptionDetailsEntity>>
      getPrescriptionItemDetails({
    required int prescriptionId,
    required int skipCount,
    required int maxResult,
  }) async {
    return CheckNet<PrescriptionDetailsEntity>().checkNetResponse(
        tryRight: () async {
      final data = await remote.getPrescriptionDetails(
          prescriptionId: prescriptionId,
          skipCount: skipCount,
          maxResult: maxResult);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, UserPrescriptioEntity>> getUserPrescriptions(
      {required int skipCount, required int maxResult}) async {
    return CheckNet<UserPrescriptioEntity>().checkNetResponse(
        tryRight: () async {
      final data = await remote.getUserPrescrioptions(
          skipCount: skipCount, maxResult: maxResult);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, UserAmountEntity>> getUserAmounts() async {
    return CheckNet<UserAmountEntity>().checkNetResponse(tryRight: () async {
      final data = await remote.getUserAmount();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, PatientFilesEntity>> getUserFiles(
      {required int skipCount, required int maxResult}) async {
    return CheckNet<PatientFilesEntity>().checkNetResponse(tryRight: () async {
      final data =
          await remote.getUserFiles(skipCount: skipCount, maxResult: maxResult);
      return Right(data);
    });
  }
}
