import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session_entity/midical_session_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/prescription_details_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/user_file_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';
import 'package:hosptel_app/features/health/domain/repository/health_repo.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

class HealthUseCase implements HealthBaseUseCase {
  final HealthRepo repo;

  HealthUseCase(this.repo);
  @override
  Future<Either<Failure, MidicalSessionEntity>> getMidicalSession(
      {required int skipCount, required int maxResult}) async {
    return await repo.getMidicalSession(
        skipCount: skipCount, maxResult: maxResult);
  }

  @override
  Future<Either<Failure, PrescriptionDetailsEntity>>
      getPrescriptionItemDetails({
    required int prescriptionId,
    required int skipCount,
    required int maxResult,
  }) async {
    return await repo.getPrescriptionItemDetails(
        prescriptionId: prescriptionId,
        skipCount: skipCount,
        maxResult: maxResult);
  }

  @override
  Future<Either<Failure, UserPrescriptioEntity>> getUserPrescriptions(
      {required int skipCount, required int maxResult}) async {
    return await repo.getUserPrescriptions(
        skipCount: skipCount, maxResult: maxResult);
  }

  @override
  Future<Either<Failure, UserAmountEntity>> getUserAmounts(
      {required int skipCount, required int maxResult}) async {
    return await repo.getUserAmounts(
        maxResult: maxResult, skipCount: skipCount);
  }

  @override
  Future<Either<Failure, UserFileEntity>> getUserFiles(
      {required int skipCount, required int maxResult}) async {
    return await repo.getUserFiles(skipCount: skipCount, maxResult: maxResult);
  }

  @override
  Future<Either<Failure, Unit>> downloadFile(
      {required String url, required String name}) async {
    return await repo.downloadFile(url: url, name: name);
  }
}
