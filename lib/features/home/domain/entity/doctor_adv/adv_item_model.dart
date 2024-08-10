class AdvItemModel {
  String? title;
  String? description;
  int? id;
  AdvItemModel({
    this.title,
    this.description,
    this.id,
  });
  factory AdvItemModel.fromJson(Map<String, dynamic> json) => AdvItemModel(
        title: json['title'] as String?,
        description: json['description'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'id': id,
      };
}
