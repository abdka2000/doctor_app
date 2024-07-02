class EndTime {
  int? ticks;

  EndTime({this.ticks});

  factory EndTime.fromJson(Map<String, dynamic> json) => EndTime(
        ticks: json['ticks'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ticks': ticks,
      };
}
