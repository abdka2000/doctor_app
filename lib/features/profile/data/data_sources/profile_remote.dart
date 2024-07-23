import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_delete.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/core/api/api_methode_put.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/profile/data/models/person_model.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';
import '../../../../../core/api/api_methode_get.dart';

abstract class ProfileRemoteDataSource {
  Future<Person> getProfileData();
  //-------------------------------------------------//
  Future<Unit> editProfile(Person person);
  //-------------------------------------------------//
  Future<Unit> editPhoneNumber(String phoneNumber);
  //-------------------------------------------------//
  Future<Unit> confirmEditPhoneNumber(String phoneNumber, String code);
  //-------------------------------------------------//
  Future<Unit> changePassword(String currentPassword, String newPassword);
  //-------------------------------------------------//
  Future<Unit> deleteAccount();
  //-------------------------------------------------//
  Future<Unit> logOut();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Person> getProfileData() async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiGetMethods<Person>(addHeader: headers).get(
      url: ApiGet.getProfileData,
      data: (response) {
        final data = jsonDecode(response.body);
        final person = PersonModel.fromJson(data);
        AppSharedPreferences.cashPhoneNumber(
            phoneNumber: person.phoneNumber ?? "");
        AppSharedPreferences.cashUserName(name: person.fullName ?? "");
        return person;
      },
    );
  }

  @override
  Future<Unit> editProfile(Person person) async {
    final token = AppSharedPreferences.getToken();
    final personModel = PersonModel(
        id: person.id,
        birthDate: person.birthDate,
        fullName: person.fullName,
        gender: person.gender,
        phoneNumber: person.phoneNumber);
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiPutMethods<Unit>(addHeader: headers).put(
      url: ApiPut.updateProfile,
      data: (response) => unit,
      body: personModel.toJson(),
    );
  }

  @override
  Future<Unit> confirmEditPhoneNumber(String phoneNumber, String code) async {
    final token = AppSharedPreferences.getToken();
    final query = {
      "phoneNumber": phoneNumber,
      "code": code,
    };
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiPostMethods<Unit>(addHeader: headers).post(
        url: ApiPost.confirmEditPhoneNumber,
        data: (response) => unit,
        query: query);
  }

  @override
  Future<Unit> editPhoneNumber(String phoneNumber) {
    final token = AppSharedPreferences.getToken();
    final query = {
      "phoneNumber": phoneNumber,
    };
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiPostMethods<Unit>(addHeader: headers).post(
        url: ApiPost.sendEditPhoneNumber,
        data: (response) => unit,
        query: query);
  }

  @override
  Future<Unit> changePassword(
      String currentPassword, String newPassword) async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    Map<String, dynamic> body = {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    };

    return ApiPostMethods<Unit>(addHeader: headers).post(
      url: ApiPost.changePassword,
      data: (response) => unit,
      body: body,
    );
  }

  @override
  Future<Unit> deleteAccount() async {
    final token = AppSharedPreferences.getToken();
    Map<String, String> headers = {
      "Authorization": token,
    };
    AppSharedPreferences.clear();
    return ApiDeleteMethods<Unit>(addHeader: headers)
        .delete(url: ApiDelete.deleteAccount, data: (response) => unit);
  }

  @override
  Future<Unit> logOut() async {
    final token = AppSharedPreferences.getToken();
    final firebaseToken = await getFirebaseToken();
    final body = {"firebaseToken": firebaseToken};
    Map<String, String> headers = {
      "Authorization": token,
    };
    return ApiPostMethods<Unit>(addHeader: headers)
        .post(url: ApiPost.logOut, data: (response) => unit, body: body);
  }

  //? Get Firebase Token :
  Future<String> getFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    return token ?? '';
  }
}
