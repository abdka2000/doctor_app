import 'item.dart';

class PagedResultDto {
  List<Item>? items;
  int? totalCount;

  PagedResultDto({this.items, this.totalCount});

  factory PagedResultDto.fromJson(Map<String, dynamic> json) {
    return PagedResultDto(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'totalCount': totalCount,
      };
}
