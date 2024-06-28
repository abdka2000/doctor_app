import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/domain/repository/health_repo.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use_case.dart';

class HealthUseCase implements HealthBaseUseCase {
  final HealthRepo repo;

  HealthUseCase(this.repo);
  @override
  Future<Either<Failure, List<MidicalSession>>> getMidicalSession({required int skipCount ,required int maxResult}) async {
    return await repo.getMidicalSession(skipCount: skipCount,maxResult: maxResult);
  }
}
