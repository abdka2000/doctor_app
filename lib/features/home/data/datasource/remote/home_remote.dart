import 'dart:convert';

import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methode_get.dart';
import '../../../../../core/api/api_methods.dart';
import '../../models/doctor_adv/adv_item_model.dart';
import '../../models/doctor_adv/doctor_adv_model.dart';
import '../../models/doctor_services/doctor_services_model.dart';
import '../../models/doctor_services/item_model.dart';

abstract class HomeReomte {
  Future<List<ItemModel>> getServices({required int skipCount ,required int maxResult});
  Future<List<AdvItemModel>> getAdvs();
}

class HomeRemoteImpl implements HomeReomte {
  @override
  Future<List<ItemModel>> getServices({required int skipCount ,required int maxResult}) async {
    final query = {
      'SkipCount': skipCount,
      'MaxResultCount': maxResult,
    };
    return ApiGetMethods<List<ItemModel>>().get(
      url: ApiGet.getServices,
      query: query,
      data: (response) {
        Map<String, dynamic> dataDecoded = jsonDecode(response.body);
        List<ItemModel> services =
            DoctorServicesModel.fromJson(dataDecoded).result!.items ?? [];
        ApiMethods().logResponse(response, ApiGet.getServices);
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
}
