import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_download.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session_entity/midical_session_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/prescription_details_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/user_file_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';

abstract class HealthRemote {
  Future<MidicalSessionEntity> getMidicalSessions(
      {required int skipCount, required int maxResult});
  //-------------------------------------------//
  Future<PrescriptionDetailsEntity> getPrescriptionDetails(
      {required int prescriptionId,
      required int skipCount,
      required int maxResult});
  //-------------------------------------------------//
  Future<UserPrescriptioEntity> getUserPrescrioptions(
      {required int skipCount, required int maxResult});
  //-------------------------------------------------//
  Future<UserAmountEntity> getUserAmount(
      {required int skipCount, required int maxResult});
  //-------------------------------------------------//
  Future<UserFileEntity> getUserFiles(
      {required int skipCount, required int maxResult});
  //-------------------------------------------------//
  Future<Unit> downloadFile({required String url, required String name});
}

class HealthRemoteImpl implements HealthRemote {
  @override
  Future<MidicalSessionEntity> getMidicalSessions(
      {required int skipCount, required int maxResult}) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<MidicalSessionEntity>(addHeader: headers).get(
        query: query,
        url: ApiGet.getMedicalSession,
        data: ((response) {
          final dataDecoded = jsonDecode(response.body);
          final sessions = MidicalSessionEntity.fromJson(dataDecoded);
          return sessions;
        }));
  }

  @override
  Future<PrescriptionDetailsEntity> getPrescriptionDetails({
    required int prescriptionId,
    required int skipCount,
    required int maxResult,
  }) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      'PrescriptionId': prescriptionId,
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<PrescriptionDetailsEntity>(addHeader: headers).get(
      url: ApiGet.getPrescriptionItemDetails,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final prescription = PrescriptionDetailsEntity.fromJson(dataDecoded);
        return prescription;
      },
      query: query,
    );
  }

  @override
  Future<UserPrescriptioEntity> getUserPrescrioptions(
      {required int skipCount, required int maxResult}) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<UserPrescriptioEntity>(addHeader: headers).get(
      url: ApiGet.getUserPrescriptions,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final userPrescriptions = UserPrescriptioEntity.fromJson(dataDecoded);
        return userPrescriptions;
      },
      query: query,
    );
  }

  @override
  Future<UserAmountEntity> getUserAmount(
      {required int skipCount, required int maxResult}) async {
    final token = AppSharedPreferences.getToken();
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    Map<String, String> headers = {
      "Authorization": token,
    };

    return ApiGetMethods<UserAmountEntity>(addHeader: headers).get(
      url: ApiGet.getUserAmount,
      query: query,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final amount = UserAmountEntity.fromJson(dataDecoded);
        return amount;
      },
    );
  }

  @override
  Future<UserFileEntity> getUserFiles(
      {required int skipCount, required int maxResult}) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<UserFileEntity>(addHeader: headers).get(
        url: ApiGet.getFiles,
        data: (response) {
          final dataDecoded = jsonDecode(response.body);
          final files = UserFileEntity.fromJson(dataDecoded);
          return files;
        },
        query: query);
  }

  @override
  Future<Unit> downloadFile({required String url, required String name}) async {
    return ApiDownloadMethods<Unit>()
        .downlad(url: url, fileName: name, data: (response) => unit);
  }
}
