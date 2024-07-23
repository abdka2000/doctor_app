import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/notification/data/data_sources/notifications_remote.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/notification_entity.dart';
import 'package:hosptel_app/features/notification/domain/repository/notifications_repository.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final NotificationsRemote remote;

  NotificationsRepoImpl({required this.remote});
  @override
  Future<Either<Failure, NotificationEntity>> getNotifications(
      {required int skipCount, required int maxResult}) async {
    return CheckNet<NotificationEntity>().checkNetResponse(tryRight: () async {
      final data = await remote.getNotifications(
          maxResult: maxResult, skipCount: skipCount);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> setNotificationsReaded(
      {required List<int?> ids}) async {
    return CheckNet<Unit>().checkNetResponse(tryRight: () async {
      final data = await remote.setNotificationsReaded(ids: ids);
      return Right(data);
    });
  }
}
