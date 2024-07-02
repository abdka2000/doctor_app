import 'appointment_symptom.dart';
import 'end_time.dart';
import 'start_time.dart';

class ReservationResponse {
  DateTime? appointmentDate;
  StartTime? startTime;
  EndTime? endTime;
  List<AppointmentSymptom>? appointmentSymptoms;

  ReservationResponse({
    this.appointmentDate,
    this.startTime,
    this.endTime,
    this.appointmentSymptoms,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      appointmentDate: json['appointmentDate'] == null
          ? null
          : DateTime.parse(json['appointmentDate'] as String),
      startTime: json['startTime'] == null
          ? null
          : StartTime.fromJson(json['startTime'] as Map<String, dynamic>),
      endTime: json['endTime'] == null
          ? null
          : EndTime.fromJson(json['endTime'] as Map<String, dynamic>),
      appointmentSymptoms: (json['appointmentSymptoms'] as List<dynamic>?)
          ?.map((e) => AppointmentSymptom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'appointmentDate': appointmentDate?.toIso8601String(),
        'startTime': startTime?.toJson(),
        'endTime': endTime?.toJson(),
        'appointmentSymptoms':
            appointmentSymptoms?.map((e) => e.toJson()).toList(),
      };
}
