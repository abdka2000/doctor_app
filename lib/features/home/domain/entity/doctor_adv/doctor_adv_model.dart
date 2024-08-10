import 'adv_resutl_model.dart';

class DoctorAdvModel {
  AdvResultModel? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;
  DoctorAdvModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory DoctorAdvModel.fromJson(Map<String, dynamic> json) => DoctorAdvModel(
        result: json['result'] == null
            ? null
            : AdvResultModel.fromJson(json['result'] as Map<String, dynamic>),
        targetUrl: json['targetUrl'] as dynamic,
        success: json['success'] as bool?,
        error: json['error'] as dynamic,
        unAuthorizedRequest: json['unAuthorizedRequest'] as bool?,
        abp: json['__abp'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'targetUrl': targetUrl,
        'success': success,
        'error': error,
        'unAuthorizedRequest': unAuthorizedRequest,
        '__abp': abp,
      };
}
