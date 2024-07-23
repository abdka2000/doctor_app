import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/notification_entity.dart';

abstract class NotificationsRepo {
  //? Repo for get notifications :
  Future<Either<Failure, NotificationEntity>> getNotifications(
      {required int skipCount, required int maxResult});
  //? Repo for set notifications readed :
  Future<Either<Failure, Unit>> setNotificationsReaded(
      {required List<int?> ids});
}
