class StartTime {
  int? ticks;

  StartTime({this.ticks});

  factory StartTime.fromJson(Map<String, dynamic> json) => StartTime(
        ticks: json['ticks'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ticks': ticks,
      };
}
