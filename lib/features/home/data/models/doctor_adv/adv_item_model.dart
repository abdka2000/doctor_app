import '../../../domain/entity/doctor_adv/adv_item.dart';

class AdvItemModel extends AdvItem {
  AdvItemModel({
    super.title,
    super.description,
    super.id,
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
