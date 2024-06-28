import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/availabe_day/available_days.dart';
import '../entities/available_times/available_times.dart';
import '../entities/reservation_item/reservation_item.dart';

abstract class ReservationRepository {
  Future<Either<Failure, List<ReservationItemEntity>>> getReservation(
      {required bool isFinished,required int skipCount ,required int maxResult});
  Future<Either<Failure, List<AvailableDays>>> getAvailableDays();
  Future<Either<Failure, List<AvailableTimes>>> getAvailablesTime(
      {required String date});
}
