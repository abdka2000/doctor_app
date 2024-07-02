import 'start_time.dart';

class ReservationItemEntity {
  final int? id;
  final int? order;
  final DateTime? appointmentDate;
  final String? startTime;
  final String? dayName;

  ReservationItemEntity({
    required this.id,
    required this.order,
    required this.appointmentDate,
    required this.startTime,
    required this.dayName,
  });
}
