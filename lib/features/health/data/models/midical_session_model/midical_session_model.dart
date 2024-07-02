import 'package:hosptel_app/features/health/domain/entities/midical_session/midical_session.dart';

import 'appointment_start_time.dart';

class MidicalSessionModel extends MidicalSession {
  MidicalSessionModel({
    super.id,
    super.creationTime,
    super.appointmentStartTime,
  });

  factory MidicalSessionModel.fromJson(Map<String, dynamic> json) {
    return MidicalSessionModel(
      id: json['id'] as int?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      appointmentStartTime: json['appointmentStartTime'] == null
          ? null
          : AppointmentStartTimeModel.fromJson(
              json['appointmentStartTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTime': creationTime?.toIso8601String(),
        'appointmentStartTime': appointmentStartTime,
      };
}
