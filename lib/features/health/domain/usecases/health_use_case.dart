import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/domain/entities/patient_files_entity/patient_files_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/prescription_details_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';
import 'package:hosptel_app/features/health/domain/repository/health_repo.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

class HealthUseCase implements HealthBaseUseCase {
  final HealthRepo repo;

  HealthUseCase(this.repo);
  @override
  Future<Either<Failure, List<MidicalSession>>> getMidicalSession(
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
  Future<Either<Failure, UserAmountEntity>> getUserAmounts() async {
    return await repo.getUserAmounts();
  }

  @override
  Future<Either<Failure, PatientFilesEntity>> getUserFiles(
      {required int skipCount, required int maxResult}) async {
    return await repo.getUserFiles(skipCount: skipCount, maxResult: maxResult);
  }
}
