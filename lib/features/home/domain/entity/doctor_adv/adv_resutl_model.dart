import 'adv_item_model.dart';

class AdvResultModel {
  int? totalCount;
  List<AdvItemModel>? items;

  AdvResultModel({
    this.items,
    this.totalCount,
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
