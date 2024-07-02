import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/user_work_hours.dart';
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
      {required bool isFinished,
      required int skipCount,
      required int maxResult}) async {
    return CheckNet<List<ReservationItemEntity>>().checkNetResponse(
        tryRight: () async {
      final data = await remoteDataSource.getReservation(
          isFinished: isFinished, skipCount: skipCount, maxResult: maxResult);
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

  @override
  Future<Either<Failure, UserWorkHours>> getWorkHours() async {
    return CheckNet<UserWorkHours>().checkNetResponse(tryRight: () async {
      final data = await remoteDataSource.getWorkHours();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, SymptomEntity>> getSymptoms() async {
    return CheckNet<SymptomEntity>().checkNetResponse(tryRight: () async {
      final data = await remoteDataSource.getSymptoms();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> createAppoinment(
      {required ReservationResponse reservation}) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data =
          await remoteDataSource.createAppoinment(reservation: reservation);
      return Right(data);
    });
  }
}
