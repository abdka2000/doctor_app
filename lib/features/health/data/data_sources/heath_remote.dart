import 'dart:convert';

import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/health/data/models/midical_session_model/midical_session_model.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';

abstract class HealthRemote {
  Future<List<MidicalSession>> getMidicalSessions({required int skipCount ,required int maxResult});
}

class HealthRemoteImpl implements HealthRemote {
  @override
  Future<List<MidicalSession>> getMidicalSessions(
    {required int skipCount ,required int maxResult}) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<List<MidicalSession>>(addHeader: headers).get(
        query: query,
        url: ApiGet.getMedicalSession,
        data: ((response) {
          final dataDecoded = jsonDecode(response.body);
          List items = dataDecoded['result']['items'];
          List<MidicalSession> sessions =
              items.map((e) => MidicalSessionModel.fromJson(e)).toList();
          return sessions;
        }));
  }
}
