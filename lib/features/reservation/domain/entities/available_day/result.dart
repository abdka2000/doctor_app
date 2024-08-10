class Result {
  String? name;
  String? date;

  Result({this.name, this.date});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json['name'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'date': date,
      };
}
