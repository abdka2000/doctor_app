class Item {
  String? name;
  int? id;

  Item({this.name, this.id});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['name'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
