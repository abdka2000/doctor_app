import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methode_post.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../domin/entities/req/create_account_request_entite.dart';
import '../../../domin/entities/req/login_request_entite.dart';
import '../../../domin/entities/res/login_response_entity/login_response_entity.dart';

abstract class AuthRemote {
  //? Create Account Remot :
  Future<Unit> createAccount({
    required CreateAccoutRequestEntite request,
  });
  //? Confirm Account Remot :
  Future<Unit> confirmAccount({
    required String phoneNumber,
    required String code,
  });

  //? Send Code
  Future<Unit> sendCode({
    required String phoneNum,
  });
  //? Log in Remote:
  Future<LoginResponseEntity> logIn({
    required LoginRequest request,
  });
  //? Forgot Password Remote:
  Future<Unit> forgotPassword({required String phoneNumber});
  //? Confirm Password Remote :
  Future<Unit> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  });
  //? Reset Password Remote:
  Future<Unit> resetPassword({
    required String phoneNumber,
    required String code,
    required String password,
  });
}

class AuthRemoteImpl implements AuthRemote {
  //? Create Account Remote Impl :
  @override
  Future<Unit> createAccount({
    required CreateAccoutRequestEntite request,
  }) async {
    return ApiPostMethods<Unit>().post(
      body: request.toJson(),
      url: ApiPost.createAccount,
      data: (response) => unit,
    );
  }

//? confirm Account Impl :
  @override
  Future<Unit> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    return ApiPostMethods<Unit>().post(
      query: {
        "phoneNumber": phoneNumber,
        "code": code,
      },
      url: ApiPost.confirmPatientAccount,
      data: (response) => unit,
    );
  }

  //?  Log in Impl :
  @override
  Future<LoginResponseEntity> logIn({required LoginRequest request}) async {
    final firebaseToken = await getFirebaseToken();
    final body = {
      "password": request.password,
      "phoneNumber": request.phoneNumber,
      "firebaseToken": firebaseToken,
    };
    return ApiPostMethods<LoginResponseEntity>().post(
      body: body,
      url: ApiPost.login,
      data: (response) {
        Map<String, dynamic> data = jsonDecode(response.body);
        final loginRes = LoginResponseEntity.fromJson(data);
        ApiMethods().logResponse(response, ApiGet.getServices);
        return loginRes;
      },
    );
  }

  @override
  Future<Unit> sendCode({required String phoneNum}) async {
    final query = {
      "phoneNumber": phoneNum,
    };
    return ApiPostMethods<Unit>().post(
      query: query,
      url: ApiPost.sendLink,
      data: (response) => unit,
    );
  }

  @override
  Future<Unit> forgotPassword({required String phoneNumber}) async {
    final query = {
      "phoneNumber": phoneNumber,
    };
    return ApiPostMethods<Unit>().post(
        url: ApiPost.forgetPassword, query: query, data: (response) => unit);
  }

  @override
  Future<Unit> confirmForgetPassword(
      {required String phoneNumber, required String code}) async {
    final query = {
      "phoneNumber": phoneNumber,
      "code": code,
    };
    return ApiPostMethods<Unit>().post(
        url: ApiPost.confirmForgetPassword,
        data: (response) => unit,
        query: query);
  }

  @override
  Future<Unit> resetPassword(
      {required String phoneNumber,
      required String code,
      required String password}) async {
    final body = {
      "phoneNumber": phoneNumber,
      "code": code,
      "newPassword": password,
    };
    return ApiPostMethods<Unit>().post(
      url: ApiPost.resetPassword,
      data: (response) => unit,
      body: body,
    );
  }

  //? Get Firebase Token :
  Future<String> getFirebaseToken() async {
    final firebaseToken = await FirebaseMessaging.instance.getToken();
    return firebaseToken ?? '';
  }
}
