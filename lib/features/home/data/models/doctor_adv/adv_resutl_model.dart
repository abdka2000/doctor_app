import 'adv_item_model.dart';
import '../../../domain/entity/doctor_adv/adv_result.dart';

class AdvResultModel extends AdvResult {
  AdvResultModel({
    super.items,
    super.totalCount,
  });

  factory AdvResultModel.fromJson(Map<String, dynamic> json) => AdvResultModel(
        totalCount: json['totalCount'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => AdvItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'totalCount': totalCount,
        'items': items,
      };
}
