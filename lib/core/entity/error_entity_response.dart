import 'dart:convert';

ErrorResponseEntity errorResponseEntityFromJson(
        {required String str, required int code}) =>
    ErrorResponseEntity.fromJson(json.decode(str), code);

String errorResponseEntityToJson(ErrorResponseEntity? data) =>
    json.encode(data!.toJson());

class ErrorResponseEntity {
  ErrorResponseEntity({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  dynamic result;
  dynamic targetUrl;
  bool success;
  Error error;
  bool unAuthorizedRequest;
  bool abp;

  factory ErrorResponseEntity.fromJson(Map<String, dynamic> json, int code) =>
      ErrorResponseEntity(
        result: json["result"] ?? {},
        targetUrl: json["targetUrl"] ?? "",
        success: json["success"] ?? false,
        error: Error.fromJson(json["error"] ?? {}, code),
        unAuthorizedRequest: json["unAuthorizedRequest"] ?? false,
        abp: json["__abp"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "targetUrl": targetUrl,
        "success": success,
        "error": error.toJson(),
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class Error {
  Error({
    required this.code,
    required this.message,
    required this.details,
    required this.validationErrors,
  });

  int? code;
  String? message;
  String? details;
  dynamic validationErrors;

  factory Error.fromJson(Map<String, dynamic> json, int code) => Error(
        code: code,
        message: json["message"] ?? "",
        details: json["details"] ?? "",
        validationErrors: json["validationErrors"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "details": details,
        "validationErrors": validationErrors,
      };
}
