import 'item.dart';

class Result {
  int? totalCount;
  List<Item>? items;

  Result({this.totalCount, this.items});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalCount: json['totalCount'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'totalCount': totalCount,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
