import 'adv_resutl_model.dart';
import '../../../domain/entity/doctor_adv/doctor_adv.dart';

class DoctorAdvModel extends DoctorAdv {
  DoctorAdvModel({
    super.result,
    super.targetUrl,
    super.success,
    super.error,
    super.unAuthorizedRequest,
    super.abp,
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
