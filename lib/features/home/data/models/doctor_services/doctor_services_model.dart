import 'result_model.dart';
import '../../../domain/entity/doctor_services/doctor_services_entity.dart';

class DoctorServicesModel extends DoctorServices {
  DoctorServicesModel(
      {super.result,
      super.targetUrl,
      super.success,
      super.error,
      super.unAuthorizedRequest,
      super.abp});

  factory DoctorServicesModel.fromJson(Map<String, dynamic> json) {
    return DoctorServicesModel(
      result: ResultModel.fromJson(json["result"]),
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
