import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/notification/domain/entities/notification_entity/notification_entity.dart';

abstract class NotificationsRemote {
  Future<NotificationEntity> getNotifications(
      {required int maxResult, required int skipCount});
  //-----------------------------------------------------//
  Future<Unit> setNotificationsReaded({required List<int?> ids});
}

class NotificationsRemoteImpl implements NotificationsRemote {
  @override
  Future<NotificationEntity> getNotifications(
      {required int maxResult, required int skipCount}) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<NotificationEntity>(addHeader: headers).get(
      url: ApiGet.getNotifications,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final notifications = NotificationEntity.fromJson(dataDecoded);
        return notifications;
      },
      query: query,
    );
  }

  @override
  Future<Unit> setNotificationsReaded({required List<int?> ids}) {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiPostMethods<Unit>(addHeader: headers).post(
        url: ApiPost.setNotificationsReaded,
        data: (response) => unit,
        body: ids);
  }
}
