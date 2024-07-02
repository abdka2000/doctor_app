import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/user_work_hours.dart';

import '../../../../core/api/api_links.dart';
import '../../../../core/api/api_methode_get.dart';
import '../../../../core/shared/shared_pref.dart';
import '../model/available_days/available_days_model.dart';
import '../model/available_times/available_times_model.dart';
import '../model/reservation_items/reservation_items.dart';
import '../../domain/entities/availabe_day/available_days.dart';
import '../../domain/entities/available_times/available_times.dart';
import '../../domain/entities/reservation_item/reservation_item.dart';

abstract class ReservationRemoteDataSource {
  Future<List<ReservationItemEntity>> getReservation(
      {required bool isFinished,
      required int skipCount,
      required int maxResult});
  //-------------------------------------------//
  Future<List<AvailableDays>> getAvailableDays();
  //-------------------------------------------//
  Future<List<AvailableTimes>> getAvailablesTime({required String date});
  //-------------------------------------------//
  Future<UserWorkHours> getWorkHours();
  //-------------------------------------------//
  Future<SymptomEntity> getSymptoms();
  //-------------------------------------------//
  Future<Unit> createAppoinment({required ReservationResponse reservation});
}

class ReservationRemoteDataSourceImpl implements ReservationRemoteDataSource {
  @override
  Future<List<ReservationItemEntity>> getReservation({
    required bool isFinished,
    required int skipCount,
    required int maxResult,
  }) {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    final query = {
      "IsEnded": isFinished,
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };

    return ApiGetMethods<List<ReservationItemEntity>>(addHeader: headers).get(
      query: query,
      url: ApiGet.getReservations,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final reservations = ReservationsModel.fromJson(dataDecoded);
        return reservations.items!;
      },
    );
  }

  @override
  Future<List<AvailableDays>> getAvailableDays() {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiGetMethods<List<AvailableDays>>(addHeader: headers).get(
      url: ApiGet.getAvailableDays,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        List result = dataDecoded['result'];
        List<AvailableDays> days = result
            .map<AvailableDays>((e) => AvailableDaysModel.fromJson(e))
            .toList();
        return days;
      },
    );
  }

  @override
  Future<List<AvailableTimes>> getAvailablesTime({required String date}) {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    Map<String, String> query = {
      "date": date,
    };
    return ApiGetMethods<List<AvailableTimes>>(addHeader: headers).get(
        url: ApiGet.getAvailableTimes,
        query: query,
        data: (response) {
          final dataDecoded = jsonDecode(response.body);
          List result = dataDecoded['result'];
          List<AvailableTimes> times = result
              .map<AvailableTimesModel>((e) => AvailableTimesModel.fromJson(e))
              .toList();
          return times;
        });
  }

  @override
  Future<UserWorkHours> getWorkHours() async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiGetMethods<UserWorkHours>(addHeader: headers).get(
        url: ApiGet.getWorkHours,
        data: (response) {
          final dataDecoded = jsonDecode(response.body);
          final userWorkHours = UserWorkHours.fromJson(dataDecoded);
          return userWorkHours;
        });
  }

  @override
  Future<SymptomEntity> getSymptoms() async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiGetMethods<SymptomEntity>(addHeader: headers).get(
        url: ApiGet.getSymptoms,
        data: (responde) {
          final dataDecoded = jsonDecode(responde.body);
          final symptoms = SymptomEntity.fromJson(dataDecoded);
          return symptoms;
        });
  }

  @override
  Future<Unit> createAppoinment(
      {required ReservationResponse reservation}) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiPostMethods<Unit>(addHeader: headers).post(
      url: ApiPost.createAppoinment,
      data: (response) => unit,
      body: reservation.toJson(),
    );
  }
}
