
class ReservationItemEntity {
  final int? id;
  final int? order;
  final DateTime? appointmentDate;
  final String? startTime;
  final String? dayName;

  ReservationItemEntity({
     this.id,
     this.order,
     this.appointmentDate,
     this.startTime,
     this.dayName,
  });
}
