import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/check_net.dart';
import '../data_sources/reservation_remote_data_source.dart';
import '../../domain/entities/availabe_day/available_days.dart';
import '../../domain/entities/available_times/available_times.dart';
import '../../domain/entities/reservation_item/reservation_item.dart';
import '../../domain/repository/reservation_repo.dart';

class ReservationRepoImpl implements ReservationRepository {
  final ReservationRemoteDataSource remoteDataSource;

  ReservationRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<ReservationItemEntity>>> getReservation(
      {required bool isFinished}) async {
    return CheckNet<List<ReservationItemEntity>>().checkNetResponse(
        tryRight: () async {
      final data =
          await remoteDataSource.getReservation(isFinished: isFinished);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, List<AvailableDays>>> getAvailableDays() {
    return CheckNet<List<AvailableDays>>().checkNetResponse(tryRight: () async {
      final data = await remoteDataSource.getAvailableDays();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, List<AvailableTimes>>> getAvailablesTime(
      {required String date}) {
    return CheckNet<List<AvailableTimes>>().checkNetResponse(
        tryRight: () async {
      final data = await remoteDataSource.getAvailablesTime(date: date);
      return Right(data);
    });
  }
}
