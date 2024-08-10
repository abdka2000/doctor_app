import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/reservation/domain/entities/available_day/available_day.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_item/reservation_items.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/user_work_hours.dart';
import '../../../../core/error/failure.dart';
import '../entities/available_times/available_times.dart';

abstract class ReservationBaseUseCase {
  Future<Either<Failure, ReservationEntity>> getReservation(
      {required bool isFinished,
      required int skipCount,
      required int maxResult});
  Future<Either<Failure, AvailableDays>> getAvailableDays();
  Future<Either<Failure, AvailableTimes>> getAvailablesTime(
      {required String date});
  Future<Either<Failure, UserWorkHours>> getWorkHours();
  Future<Either<Failure, SymptomEntity>> getSymptoms({
    required int skipCount,
    required int maxResult,
  });
  Future<Either<Failure, Unit>> createAppoinment(
      {required ReservationResponse reservation});
}
