import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/availabe_day/available_days.dart';
import '../entities/available_times/available_times.dart';
import '../entities/reservation_item/reservation_item.dart';
import '../repository/reservation_repo.dart';
import 'reservation_base_use_case.dart';

class ReservationUseCaseImpl implements ReservationBaseUseCase {
  final ReservationRepository repo;

  ReservationUseCaseImpl({required this.repo});
  @override
  Future<Either<Failure, List<ReservationItemEntity>>> getReservation(
      {required bool isFinished}) async {
    return await repo.getReservation(isFinished: isFinished);
  }

  @override
  Future<Either<Failure, List<AvailableDays>>> getAvailableDays() async {
    return await repo.getAvailableDays();
  }

  @override
  Future<Either<Failure, List<AvailableTimes>>> getAvailablesTime(
      {required String date}) async {
    return await repo.getAvailablesTime(date: date);
  }
}
