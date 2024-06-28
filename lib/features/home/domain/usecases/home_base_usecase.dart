import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/doctor_adv/adv_item_model.dart';
import '../../data/models/doctor_services/item_model.dart';

abstract class HomeBaseUseCase {
  Future<Either<Failure, List<ItemModel>>> getServicesUseCase({required int skipCount ,required int maxResult});
  Future<Either<Failure, List<AdvItemModel>>> getAdvsUseCase();
}
