import 'dart:convert';

import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/health/data/models/midical_session_model/midical_session_model.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';
import 'package:hosptel_app/features/health/domain/entities/patient_files_entity/patient_files_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/prescription_details_entity/prescription_details_entity.dart';
import 'package:hosptel_app/features/health/domain/entities/user_amount/user_amount.dart';
import 'package:hosptel_app/features/health/domain/entities/user_prescriptio_entity/user_prescriptio_entity.dart';

abstract class HealthRemote {
  Future<List<MidicalSession>> getMidicalSessions(
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
  Future<UserAmountEntity> getUserAmount();
  //-------------------------------------------------//
  Future<PatientFilesEntity> getUserFiles(
      {required int skipCount, required int maxResult});
}

class HealthRemoteImpl implements HealthRemote {
  @override
  Future<List<MidicalSession>> getMidicalSessions(
      {required int skipCount, required int maxResult}) async {
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
  Future<UserAmountEntity> getUserAmount() async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };

    return ApiGetMethods<UserAmountEntity>(addHeader: headers).get(
      url: ApiGet.getUserAmount,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final amount = UserAmountEntity.fromJson(dataDecoded);
        return amount;
      },
    );
  }

  @override
  Future<PatientFilesEntity> getUserFiles(
      {required int skipCount, required int maxResult}) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<PatientFilesEntity>(addHeader: headers).get(
        url: ApiGet.getFiles,
        data: (response) {
          final dataDecoded = jsonDecode(response.body);
          final files = PatientFilesEntity.fromJson(dataDecoded);
          return files;
        },
        query: query);
  }
}
