import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/health/data/data_sources/heath_remote.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/domain/repository/health_repo.dart';

class HealthRepoImpl implements HealthRepo {
  final HealthRemote remote;

  HealthRepoImpl({required this.remote});
  @override
  Future<Either<Failure, List<MidicalSession>>> getMidicalSession({required int skipCount ,required int maxResult}) async {
    return CheckNet<List<MidicalSession>>().checkNetResponse(
        tryRight: () async {
      final data = await remote.getMidicalSessions(maxResult: maxResult , skipCount: skipCount);
      return Right(data);
    });
  }
}
