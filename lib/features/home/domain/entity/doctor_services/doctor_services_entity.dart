import 'result_entity.dart';

class DoctorServices {
  DoctorServices({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  final Result? result;
  final dynamic targetUrl;
  final bool? success;
  final dynamic error;
  final bool? unAuthorizedRequest;
  final bool? abp;

  factory DoctorServices.fromJson(Map<String, dynamic> json) {
    return DoctorServices(
      result: Result.fromJson(json["result"]),
      targetUrl: json["targetUrl"],
      success: json["success"],
      error: json["error"],
      unAuthorizedRequest: json["unAuthorizedRequest"],
      abp: json["__abp"],
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result,
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}
