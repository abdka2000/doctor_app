import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/home/data/models/doctor_services/doctor_services_model.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/doctor_adv/adv_item_model.dart';
import '../../data/models/doctor_services/item_model.dart';

abstract class HomeRepository {
  //? Repo for services
  Future<Either<Failure, DoctorServicesModel>> getServices(
      {required int skipCount, required int maxResult});
  //? Repo for advs
  Future<Either<Failure, List<AdvItemModel>>> getAdvs();
  //? Repo for Doctor Info
  Future<Either<Failure, DoctorInfoEntity>> getDoctorInfo();
}
