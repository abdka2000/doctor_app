import 'package:hosptel_app/features/home/domain/entity/doctor_services/item_entity.dart';

class Result {
  Result({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<Item>? items;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      totalCount: json["totalCount"],
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items,
      };
}
