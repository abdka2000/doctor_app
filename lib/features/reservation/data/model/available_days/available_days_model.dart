import '../../../domain/entities/availabe_day/available_days.dart';

class AvailableDaysModel extends AvailableDays {
  AvailableDaysModel({
    super.name,
    super.date,
  });

  factory AvailableDaysModel.fromJson(Map<String, dynamic> json) =>
      AvailableDaysModel(
        name: json['name'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'date': date,
      };
}
