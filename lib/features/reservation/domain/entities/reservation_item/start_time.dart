class StartTime {
  final int? ticks;
  final int? days;
  final int? hours;
  final int? milliseconds;
  final int? microseconds;
  final int? nanoseconds;
  final int? minutes;
  final int? seconds;
  final int? totalDays;
  final int? totalHours;
  final int? totalMilliseconds;
  final int? totalMicroseconds;
  final int? totalNanoseconds;
  final int? totalMinutes;
  final int? totalSeconds;

  StartTime({
    required this.ticks,
    required this.days,
    required this.hours,
    required this.milliseconds,
    required this.microseconds,
    required this.nanoseconds,
    required this.minutes,
    required this.seconds,
    required this.totalDays,
    required this.totalHours,
    required this.totalMilliseconds,
    required this.totalMicroseconds,
    required this.totalNanoseconds,
    required this.totalMinutes,
    required this.totalSeconds,
  });

  

  factory StartTime.fromJson(Map<String, dynamic> json) => StartTime(
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
