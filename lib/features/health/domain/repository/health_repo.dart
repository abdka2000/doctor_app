import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/domain/entities/patient_files_entity/patient_files_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/prescription_details_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';

abstract class HealthRepo {
  //? Repo for Sessions
  Future<Either<Failure, List<MidicalSession>>> getMidicalSession(
      {required int skipCount, required int maxResult});
  //? Repo for Prescription Details
  Future<Either<Failure, PrescriptionDetailsEntity>>
      getPrescriptionItemDetails({
    required int prescriptionId,
    required int skipCount,
    required int maxResult,
  });
  //? Repo for User Prescription
  Future<Either<Failure, UserPrescriptioEntity>> getUserPrescriptions({
    required int skipCount,
    required int maxResult,
  });
  //? Repo for User Amount
  Future<Either<Failure, UserAmountEntity>> getUserAmounts();
  //? Repo for User Files
  Future<Either<Failure, PatientFilesEntity>> getUserFiles(
      {required int skipCount, required int maxResult});
}
