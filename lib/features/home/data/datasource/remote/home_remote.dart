import 'dart:convert';

import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_services/doctor_services_entity.dart';

import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methode_get.dart';
import '../../../domain/entity/doctor_adv/adv_item_model.dart';
import '../../../domain/entity/doctor_adv/doctor_adv_model.dart';

abstract class HomeReomte {
  //? Remote for get services :
  Future<DoctorServices> getServices(
      {required int skipCount, required int maxResult});

  //? Remote for get advertisements :
  Future<List<AdvItemModel>> getAdvs();

  //? Remote for get doctor info :
  Future<DoctorInfoEntity> getDoctorInfo();
}

class HomeRemoteImpl implements HomeReomte {
  @override
  Future<DoctorServices> getServices(
      {required int skipCount, required int maxResult}) async {
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<DoctorServices>().get(
      url: ApiGet.getServices,
      query: query,
      data: (response) {
        final dataDecoded = jsonDecode(response.body);
        final services = DoctorServices.fromJson(dataDecoded);
        return services;
      },
    );
  }

  @override
  Future<List<AdvItemModel>> getAdvs() async {
    return ApiGetMethods<List<AdvItemModel>>().get(
      url: ApiGet.getAdvs,
      data: (response) {
        Map<String, dynamic> dataDecoded = jsonDecode(response.body);
        List<AdvItemModel> advs =
            DoctorAdvModel.fromJson(dataDecoded).result!.items ?? [];
        return advs;
      },
    );
  }

  @override
  Future<DoctorInfoEntity> getDoctorInfo() async {
    return ApiGetMethods<DoctorInfoEntity>().get(
        url: ApiGet.getDoctorInfo,
        data: (response) {
          final dataDecoded = jsonDecode(response.body);
          final info = DoctorInfoEntity.fromJson(dataDecoded);
          return info;
        });
  }
}
