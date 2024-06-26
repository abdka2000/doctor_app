import '../../../data/models/doctor_services/item_model.dart';

class Result {
  Result({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<ItemModel>? items;
}
