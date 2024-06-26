import '../../../domain/entities/available_times/available_times.dart';

class AvailableTimesModel extends AvailableTimes {
  AvailableTimesModel({
    super.fromTime,
    super.toTime,
    super.isBooked,
    super.isSetUnavailable,
  });

  factory AvailableTimesModel.fromJson(Map<String, dynamic> json) =>
      AvailableTimesModel(
        fromTime: json['fromTime'] as String?,
        toTime: json['toTime'] as String?,
        isBooked: json['isBooked'] as bool?,
        isSetUnavailable: json['isSetUnavailable'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'fromTime': fromTime,
        'toTime': toTime,
        'isBooked': isBooked,
        'isSetUnavailable': isSetUnavailable,
      };
}
