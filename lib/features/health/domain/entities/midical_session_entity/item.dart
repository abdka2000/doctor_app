class Item {
  DateTime? creationTime;
  String? appointmentStartTime;
  int? id;

  Item({this.creationTime, this.appointmentStartTime, this.id});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime'] as String),
        appointmentStartTime: json['appointmentStartTime'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'creationTime': creationTime?.toIso8601String(),
        'appointmentStartTime': appointmentStartTime,
        'id': id,
      };
}
