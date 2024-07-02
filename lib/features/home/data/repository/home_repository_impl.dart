import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/check_net.dart';
import '../datasource/remote/home_remote.dart';
import '../models/doctor_adv/adv_item_model.dart';
import '../models/doctor_services/item_model.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeReomte remote;

  HomeRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<ItemModel>>> getServices(
      {required int skipCount, required int maxResult}) async {
    return CheckNet<List<ItemModel>>().checkNetResponse(tryRight: () async {
      final data =
          await remote.getServices(skipCount: skipCount, maxResult: maxResult);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, List<AdvItemModel>>> getAdvs() async {
    return CheckNet<List<AdvItemModel>>().checkNetResponse(tryRight: () async {
      final data = await remote.getAdvs();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, DoctorInfoEntity>> getDoctorInfo() async {
    return CheckNet<DoctorInfoEntity>().checkNetResponse(tryRight: () async {
      final data = await remote.getDoctorInfo();
      return Right(data);
    });
  }
}
