import 'reservation_item.dart';

class ReservationEntity {
  final List<ReservationItemEntity>? items;
  final int? totalCount;

  ReservationEntity({
    required this.items,
    required this.totalCount,
  });
}
