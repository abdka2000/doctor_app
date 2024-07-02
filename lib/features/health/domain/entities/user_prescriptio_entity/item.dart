class Item {
  int? id;
  DateTime? creationTime;

  Item({this.id, this.creationTime});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'creationTime': creationTime?.toIso8601String(),
      };
}
