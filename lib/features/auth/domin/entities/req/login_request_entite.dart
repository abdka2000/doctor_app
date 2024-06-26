// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) {
  return LoginRequest.fromJson(json.decode(str));
}

String loginRequestToJson(LoginRequest data) {
  return json.encode(data.toJson());
}

class LoginRequest {
  LoginRequest({
    required this.isGuest,
    required this.phoneNumber,
    required this.password,
  });

  bool isGuest;
  String phoneNumber;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      isGuest: json["is_guest"] ?? '',
      phoneNumber: json["username"] ?? '',
      password: json["password"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "is_guest": isGuest,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}
