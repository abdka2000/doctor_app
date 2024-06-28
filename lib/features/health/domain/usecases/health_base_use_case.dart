import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';

abstract class HealthBaseUseCase{
    Future<Either<Failure, List<MidicalSession>>> getMidicalSession({required int skipCount ,required int maxResult});

}