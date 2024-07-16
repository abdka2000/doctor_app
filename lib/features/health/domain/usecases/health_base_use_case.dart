import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session_entity/midical_session_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/prescription_details_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/user_file_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';

abstract class HealthBaseUseCase {
  Future<Either<Failure, MidicalSessionEntity>> getMidicalSession(
      {required int skipCount, required int maxResult});
  Future<Either<Failure, PrescriptionDetailsEntity>>
      getPrescriptionItemDetails({
    required int prescriptionId,
    required int skipCount,
    required int maxResult,
  });
  Future<Either<Failure, UserPrescriptioEntity>> getUserPrescriptions({
    required int skipCount,
    required int maxResult,
  });
  Future<Either<Failure, UserAmountEntity>> getUserAmounts(
      {required int skipCount, required int maxResult});
  Future<Either<Failure, UserFileEntity>> getUserFiles(
      {required int skipCount, required int maxResult});
      Future<Either<Failure, Unit>> downloadFile(
      {required String url, required String name});
}
