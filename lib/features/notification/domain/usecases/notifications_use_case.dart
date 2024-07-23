import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/notification_entity.dart';
import 'package:hosptel_app/features/notification/domain/repository/notifications_repository.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notifications_base_use_case.dart';

class NotificationsUseCase implements NotificationsBaseUseCase {
  final NotificationsRepo repo;

  NotificationsUseCase({required this.repo});
  @override
  Future<Either<Failure, NotificationEntity>> getNotifications(
      {required int skipCount, required int maxResult}) async {
    return await repo.getNotifications(
        skipCount: skipCount, maxResult: maxResult);
  }

  @override
  Future<Either<Failure, Unit>> setNotificationsReaded(
      {required List<int?> ids}) async {
    return await repo.setNotificationsReaded(ids: ids);
  }
}
