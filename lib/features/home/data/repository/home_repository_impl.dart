import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/check_net.dart';
import '../datasource/remote/home_remote.dart';
import '../models/doctor_adv/adv_item_model.dart';
import '../models/doctor_services/item_model.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeReomte reomte;

  HomeRepositoryImpl({required this.reomte});

  @override
  Future<Either<Failure, List<ItemModel>>> getServices() async {
    return CheckNet<List<ItemModel>>().checkNetResponse(tryRight: () async {
      final data = await reomte.getServices();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, List<AdvItemModel>>> getAdvs() async {
    return CheckNet<List<AdvItemModel>>().checkNetResponse(tryRight: () async {
      final data = await reomte.getAdvs();
      return Right(data);
    });
  }
}
