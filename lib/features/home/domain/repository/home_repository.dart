import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_services/doctor_services_entity.dart';
import '../../../../core/error/failure.dart';
import '../entity/doctor_adv/adv_item_model.dart';

abstract class HomeRepository {
  //? Repo for services
  Future<Either<Failure, DoctorServices>> getServices(
      {required int skipCount, required int maxResult});
  //? Repo for advs
  Future<Either<Failure, List<AdvItemModel>>> getAdvs();
  //? Repo for Doctor Info
  Future<Either<Failure, DoctorInfoEntity>> getDoctorInfo();
}
