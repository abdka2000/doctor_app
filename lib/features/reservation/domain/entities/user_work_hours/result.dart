class Result {
  int? dayId;
  String? dayName;
  String? fromTime;
  String? toTime;
  int? id;

  Result({this.dayId, this.dayName, this.fromTime, this.toTime, this.id});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        dayId: json['dayId'] as int?,
        dayName: json['dayName'] as String?,
        fromTime: json['fromTime'] as String?,
        toTime: json['toTime'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'dayId': dayId,
        'dayName': dayName,
        'fromTime': fromTime,
        'toTime': toTime,
        'id': id,
      };
}
