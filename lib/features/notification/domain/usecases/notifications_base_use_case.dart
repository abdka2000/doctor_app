import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/notification_entity.dart';

abstract class NotificationsBaseUseCase {
  Future<Either<Failure, NotificationEntity>> getNotifications(
      {required int skipCount, required int maxResult});
        Future<Either<Failure, Unit>> setNotificationsReaded(
      {required List<int?> ids});
}
