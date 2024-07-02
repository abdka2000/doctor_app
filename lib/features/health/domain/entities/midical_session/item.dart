import 'appointment_start_time.dart';

class Item {
  int? id;
  DateTime? creationTime;
  AppointmentStartTime? appointmentStartTime;

  Item({this.id, this.creationTime, this.appointmentStartTime});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime'] as String),
        appointmentStartTime: json['appointmentStartTime'] == null
            ? null
            : AppointmentStartTime.fromJson(
                json['appointmentStartTime'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTime': creationTime?.toIso8601String(),
        'appointmentStartTime': appointmentStartTime?.toJson(),
      };
}
