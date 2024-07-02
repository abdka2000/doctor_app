import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/reservation/data/model/reservation_items/reservation_items.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/user_work_hours.dart';
import '../../../../core/error/failure.dart';
import '../entities/availabe_day/available_days.dart';
import '../entities/available_times/available_times.dart';
import '../entities/reservation_item/reservation_item.dart';

abstract class ReservationRepository {
  Future<Either<Failure, ReservationsModel>> getReservation(
      {required bool isFinished,
      required int skipCount,
      required int maxResult});
  Future<Either<Failure, List<AvailableDays>>> getAvailableDays();
  Future<Either<Failure, List<AvailableTimes>>> getAvailablesTime(
      {required String date});
  Future<Either<Failure, UserWorkHours>> getWorkHours();
  Future<Either<Failure, SymptomEntity>> getSymptoms();
  Future<Either<Failure, Unit>> createAppoinment(
      {required ReservationResponse reservation});
}
