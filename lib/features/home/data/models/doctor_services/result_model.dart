import 'item_model.dart';
import '../../../domain/entity/doctor_services/result_entity.dart';

class ResultModel extends Result {
  ResultModel({
    super.totalCount,
    super.items,
  });
  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      totalCount: json["totalCount"],
      items: json["items"] == null
          ? []
          : List<ItemModel>.from(
              json["items"]!.map((x) => ItemModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items,
      };
}
