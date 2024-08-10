class Item {
  Item({
    this.name,
    this.imageUrl,
    this.id,
  });

  final String? name;
  final String? imageUrl;
  final int? id;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json["name"],
      imageUrl: json["imageUrl"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "id": id,
      };
}
