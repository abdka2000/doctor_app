import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/doctor_adv/adv_item_model.dart';
import '../../data/models/doctor_services/item_model.dart';

abstract class HomeRepository {
  //? Repo for services
  Future<Either<Failure, List<ItemModel>>> getServices();
  //? Repo for advs
  Future<Either<Failure, List<AdvItemModel>>> getAdvs();
}
