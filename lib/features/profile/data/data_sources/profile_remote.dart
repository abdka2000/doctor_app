import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_delete.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/core/api/api_methode_put.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';
import '../../../../../core/api/api_methode_get.dart';

abstract class ProfileRemoteDataSource {
  //? Remote for get profile data :
  Future<Person> getProfileData();

  //? Remote for edit profile :
  Future<Unit> editProfile(Person person);

  //? Remote for edit phone number:
  Future<Unit> editPhoneNumber(String phoneNumber);

  //? Remote for confirm phone :
  Future<Unit> confirmEditPhoneNumber(String phoneNumber, String code);

  //? Remote for change password :
  Future<Unit> changePassword(String currentPassword, String newPassword);

  //? Remote for delete account :
  Future<Unit> deleteAccount();

  //? Remote for log out :
  Future<Unit> logOut();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Person> getProfileData() async {
    return ApiGetMethods<Person>().get(
      url: ApiGet.getProfileData,
      data: (response) {
        final data = jsonDecode(response.body);
        final person = Person.fromJson(data);
        AppSharedPreferences.cashPhoneNumber(
            phoneNumber: person.phoneNumber ?? "");
        AppSharedPreferences.cashUserName(name: person.fullName ?? "");
        return person;
      },
    );
  }

  @override
  Future<Unit> editProfile(Person person) async {
    return ApiPutMethods<Unit>().put(
      url: ApiPut.updateProfile,
      data: (response) => unit,
      body: person.toJson(),
    );
  }

  @override
  Future<Unit> confirmEditPhoneNumber(String phoneNumber, String code) async {
    final query = {
      "phoneNumber": phoneNumber,
      "code": code,
    };
    return ApiPostMethods<Unit>().post(
        url: ApiPost.confirmEditPhoneNumber,
        data: (response) => unit,
        query: query);
  }

  @override
  Future<Unit> editPhoneNumber(String phoneNumber) {
    final query = {
      "phoneNumber": phoneNumber,
    };
    return ApiPostMethods<Unit>().post(
        url: ApiPost.sendEditPhoneNumber,
        data: (response) => unit,
        query: query);
  }

  @override
  Future<Unit> changePassword(
      String currentPassword, String newPassword) async {
    Map<String, dynamic> body = {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    };

    return ApiPostMethods<Unit>().post(
      url: ApiPost.changePassword,
      data: (response) => unit,
      body: body,
    );
  }

  @override
  Future<Unit> deleteAccount() async {
    return ApiDeleteMethods<Unit>()
        .delete(url: ApiDelete.deleteAccount, data: (response) => unit);
  }

  @override
  Future<Unit> logOut() async {
    final firebaseToken = await getFirebaseToken();
    // TODO : Edit this from api :
    // final body = {"firebaseToken": firebaseToken};
    return ApiPostMethods<Unit>()
        // TODO : Dont forget to add body :
        .post(url: ApiPost.logOut, data: (response) => unit, body: {});
  }

  //? Get Firebase Token :
  Future<String> getFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    return token ?? '';
  }
}
