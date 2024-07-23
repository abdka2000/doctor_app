class Item {
  int? id;
  String? title;
  String? body;
  bool? isReaded;
  DateTime? creationTime;

  Item({this.id, this.title, this.body, this.isReaded, this.creationTime});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
        isReaded: json['isReaded'] as bool?,
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'isReaded': isReaded,
        'creationTime': creationTime?.toIso8601String(),
      };
}
