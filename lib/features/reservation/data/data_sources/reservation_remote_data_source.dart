import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/features/reservation/domain/entities/available_day/available_day.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_item/reservation_items.dart';
import 'package:hosptel_app/features/reservation/domain/entities/reservation_response/reservation_response.dart';
import 'package:hosptel_app/features/reservation/domain/entities/symptom_entity/symptom_entity.dart';
import 'package:hosptel_app/features/reservation/domain/entities/user_work_hours/user_work_hours.dart';
import '../../../../core/api/api_links.dart';
import '../../../../core/api/api_methode_get.dart';
import '../../../../core/shared/shared_pref.dart';
import '../../domain/entities/available_times/available_times.dart';

abstract class ReservationRemoteDataSource {
  //? Remote for get reservations :
  Future<ReservationEntity> getReservation(
      {required bool isFinished,
      required int skipCount,
      required int maxResult});

  //? Remote for get availabel days :
  Future<AvailableDays> getAvailableDays();

  //? Remote for get available times :
  Future<AvailableTimes> getAvailablesTime({required String date});

  //? Remote for get work hours :
  Future<UserWorkHours> getWorkHours();

  //? Remote for get symptoms :
  Future<SymptomEntity> getSymptoms({
    required int skipCount,
    required int maxResult,
  });

  //? Remote for create appoinment :
  Future<Unit> createAppoinment({required ReservationResponse reservation});
}

class ReservationRemoteDataSourceImpl implements ReservationRemoteDataSource {
  @override
  Future<ReservationEntity> getReservation({
    required bool isFinished,
    required int skipCount,
    required int maxResult,
  }) {
    final query = {
      "IsEnded": isFinished,
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };

    return ApiGetMethods<ReservationEntity>().get(
      query: query,
      url: ApiGet.getReservations,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final reservations = ReservationEntity.fromJson(dataDecoded);
        return reservations;
      },
    );
  }

  @override
  Future<AvailableDays> getAvailableDays() {
    return ApiGetMethods<AvailableDays>().get(
      url: ApiGet.getAvailableDays,
      data: (response) {
        Map<String, dynamic> dataDecoded = jsonDecode(response.body);
        final data = AvailableDays.fromJson(dataDecoded);
        return data;
      },
    );
  }

  @override
  Future<AvailableTimes> getAvailablesTime({required String date}) {
    Map<String, String> query = {
      "date": date,
    };
    return ApiGetMethods<AvailableTimes>().get(
        url: ApiGet.getAvailableTimes,
        query: query,
        data: (response) {
          Map<String , dynamic> dataDecoded = jsonDecode(response.body);
          final times = AvailableTimes.fromJson(dataDecoded);
          return times;
        });
  }

  @override
  Future<UserWorkHours> getWorkHours() async {
    return ApiGetMethods<UserWorkHours>().get(
        url: ApiGet.getWorkHours,
        data: (response) {
          final dataDecoded = jsonDecode(response.body);
          final userWorkHours = UserWorkHours.fromJson(dataDecoded);
          return userWorkHours;
        });
  }

  @override
  Future<SymptomEntity> getSymptoms({
    required int skipCount,
    required int maxResult,
  }) async {
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };

    return ApiGetMethods<SymptomEntity>().get(
        url: ApiGet.getSymptoms,
        query: query,
        data: (responde) {
          final dataDecoded = jsonDecode(responde.body);
          final symptoms = SymptomEntity.fromJson(dataDecoded);
          return symptoms;
        });
  }

  @override
  Future<Unit> createAppoinment(
      {required ReservationResponse reservation}) async {
    return ApiPostMethods<Unit>().post(
      url: ApiPost.createAppoinment,
      data: (response) => unit,
      body: reservation.toJson(),
    );
  }
}
