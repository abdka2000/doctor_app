import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/reservation/domain/entities/available_day/available_day.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_item/reservation_items.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/user_work_hours.dart';
import '../../../../core/error/failure.dart';
import '../entities/available_times/available_times.dart';
import '../repository/reservation_repo.dart';
import 'reservation_base_use_case.dart';

class ReservationUseCaseImpl implements ReservationBaseUseCase {
  final ReservationRepository repo;

  ReservationUseCaseImpl({required this.repo});
  @override
  Future<Either<Failure, ReservationEntity>> getReservation(
      {required bool isFinished,
      required int skipCount,
      required int maxResult}) async {
    return await repo.getReservation(
        isFinished: isFinished, maxResult: maxResult, skipCount: skipCount);
  }

  @override
  Future<Either<Failure, AvailableDays>> getAvailableDays() async {
    return await repo.getAvailableDays();
  }

  @override
  Future<Either<Failure, AvailableTimes>> getAvailablesTime(
      {required String date}) async {
    return await repo.getAvailablesTime(date: date);
  }

  @override
  Future<Either<Failure, UserWorkHours>> getWorkHours() async {
    return await repo.getWorkHours();
  }

  @override
  Future<Either<Failure, SymptomEntity>> getSymptoms({
    required int skipCount,
    required int maxResult,
  }) async {
    return await repo.getSymptoms(maxResult: maxResult, skipCount: skipCount);
  }

  @override
  Future<Either<Failure, Unit>> createAppoinment(
      {required ReservationResponse reservation}) async {
    return await repo.createAppoinment(reservation: reservation);
  }
}
