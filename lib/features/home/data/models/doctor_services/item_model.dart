import '../../../domain/entity/doctor_services/item_entity.dart';

class ItemModel extends Item {
  ItemModel({super.name, super.imageUrl, super.id});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
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
