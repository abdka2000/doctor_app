class Result {
  String? fromTime;
  String? toTime;
  bool? isBooked;
  bool? isSetUnavailable;

  Result({
    this.fromTime,
    this.toTime,
    this.isBooked,
    this.isSetUnavailable,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
