import 'reservation_item.dart';

class ReservationEntity {
  final List<ReservationItemEntity>? items;
  final int? totalCount;

  ReservationEntity({
    required this.items,
    required this.totalCount,
  });

  
  factory ReservationEntity.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> json = data['result'];
    return ReservationEntity(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ReservationItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items,
        'totalCount': totalCount,
      };
}
