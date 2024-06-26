import '../../../domain/entities/reservation_item/start_time.dart';

class StartTimeModel extends StartTime {
  StartTimeModel({
    super.ticks,
    super.days,
    super.hours,
    super.milliseconds,
    super.microseconds,
    super.nanoseconds,
    super.minutes,
    super.seconds,
    super.totalDays,
    super.totalHours,
    super.totalMilliseconds,
    super.totalMicroseconds,
    super.totalNanoseconds,
    super.totalMinutes,
    super.totalSeconds,
  });

  factory StartTimeModel.fromJson(Map<String, dynamic> json) => StartTimeModel(
        ticks: json['ticks'] as int?,
        days: json['days'] as int?,
        hours: json['hours'] as int?,
        milliseconds: json['milliseconds'] as int?,
        microseconds: json['microseconds'] as int?,
        nanoseconds: json['nanoseconds'] as int?,
        minutes: json['minutes'] as int?,
        seconds: json['seconds'] as int?,
        totalDays: json['totalDays'] as int?,
        totalHours: json['totalHours'] as int?,
        totalMilliseconds: json['totalMilliseconds'] as int?,
        totalMicroseconds: json['totalMicroseconds'] as int?,
        totalNanoseconds: json['totalNanoseconds'] as int?,
        totalMinutes: json['totalMinutes'] as int?,
        totalSeconds: json['totalSeconds'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ticks': ticks,
        'days': days,
        'hours': hours,
        'milliseconds': milliseconds,
        'microseconds': microseconds,
        'nanoseconds': nanoseconds,
        'minutes': minutes,
        'seconds': seconds,
        'totalDays': totalDays,
        'totalHours': totalHours,
        'totalMilliseconds': totalMilliseconds,
        'totalMicroseconds': totalMicroseconds,
        'totalNanoseconds': totalNanoseconds,
        'totalMinutes': totalMinutes,
        'totalSeconds': totalSeconds,
      };
}
