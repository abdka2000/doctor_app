import 'package:dartz/dartz.dart';
import 'package:hosptel_app/features/home/data/models/doctor_services/doctor_services_model.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/doctor_adv/adv_item_model.dart';
import '../repository/home_repository.dart';
import 'home_base_usecase.dart';

class HomeUseCaseImpl implements HomeBaseUseCase {
  final HomeRepository homeRepo;

  HomeUseCaseImpl(this.homeRepo);
  @override
  Future<Either<Failure, DoctorServicesModel>> getServicesUseCase(
      {required int skipCount, required int maxResult}) async {
    return await homeRepo.getServices(
        skipCount: skipCount, maxResult: maxResult);
  }

  @override
  Future<Either<Failure, List<AdvItemModel>>> getAdvsUseCase() async {
    return await homeRepo.getAdvs();
  }

  @override
  Future<Either<Failure, DoctorInfoEntity>> getDoctorInfo() async {
    return await homeRepo.getDoctorInfo();
  }
}
