class Item {
  int? id;
  int? usageTimes;
  bool? isBeforeFood;
  int? usageDuration;
  String? medicineName;

  Item({
    this.id,
    this.usageTimes,
    this.isBeforeFood,
    this.usageDuration,
    this.medicineName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        usageTimes: json['usageTimes'] as int?,
        isBeforeFood: json['isBeforeFood'] as bool?,
        usageDuration: json['usageDuration'] as int?,
        medicineName: json['medicineName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'usageTimes': usageTimes,
        'isBeforeFood': isBeforeFood,
        'usageDuration': usageDuration,
        'medicineName': medicineName,
      };
}
