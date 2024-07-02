import '../../../domain/entities/reservation_item/reservation_item.dart';

import 'start_time.dart';

class ReservationItemModel extends ReservationItemEntity {
  ReservationItemModel({
    super.id,
    super.order,
    super.appointmentDate,
    super.startTime,
    super.dayName,
  });

  factory ReservationItemModel.fromJson(Map<String, dynamic> json) =>
      ReservationItemModel(
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
