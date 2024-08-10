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

  
  factory ReservationItemEntity.fromJson(Map<String, dynamic> json) =>
      ReservationItemEntity(
        id: json['id'] as int?,
        order: json['order'] as int?,
        appointmentDate: json['appointmentDate'] == null
            ? null
            : DateTime.parse(json['appointmentDate'] as String),
        startTime:
            json['startTime'] == null ? null : json['startTime'] as String,
        dayName: json['dayName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'order': order,
        'appointmentDate': appointmentDate?.toIso8601String(),
        'startTime': startTime,
        'dayName': dayName,
      };
}
