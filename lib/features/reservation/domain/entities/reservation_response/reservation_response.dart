import 'appointment_symptom.dart';
import 'end_time.dart';
import 'start_time.dart';

class ReservationResponse {
  DateTime? appointmentDate;
  String? startTime;
  String? endTime;
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
      startTime: json['startTime'] == null ? null : json['startTime'] as String,
      endTime: json['endTime'] == null ? null : json['endTime'] as String,
      appointmentSymptoms: (json['appointmentSymptoms'] as List<dynamic>?)
          ?.map((e) => AppointmentSymptom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'appointmentDate': appointmentDate?.toIso8601String(),
        'startTime': startTime,
        'endTime': endTime,
        'appointmentSymptoms':
            appointmentSymptoms?.map((e) => e.toJson()).toList(),
      };
}
