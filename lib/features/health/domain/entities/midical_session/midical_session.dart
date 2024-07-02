import 'result.dart';

class MidicalSession {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  MidicalSession({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory MidicalSession.fromJson(Map<String, dynamic> json) {
    return MidicalSession(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      targetUrl: json['targetUrl'] as dynamic,
      success: json['success'] as bool?,
      error: json['error'] as dynamic,
      unAuthorizedRequest: json['unAuthorizedRequest'] as bool?,
      abp: json['__abp'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result?.toJson(),
        'targetUrl': targetUrl,
        'success': success,
        'error': error,
        'unAuthorizedRequest': unAuthorizedRequest,
        '__abp': abp,
      };
}
