import '../../../domain/entities/reservation_item/reservation_items.dart';

import 'item.dart';

class ReservationsModel extends ReservationEntity {
  ReservationsModel({
    super.items,
    super.totalCount,
  });

  factory ReservationsModel.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> json = data['result'];
    return ReservationsModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ReservationItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items,
        'totalCount': totalCount,
      };
}
