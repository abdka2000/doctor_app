import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../data/models/doctor_services/item_model.dart';
import '../../../domain/usecases/home_base_usecase.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(this.useCase) : super(ServicesState.initial());
  final HomeBaseUseCase useCase;

  List<ItemModel> servicesList = [];
  //TODO : Dont Forget it After Editing
  int max = 1;
  int skip = 0;

  Future<void> getServices() async {
    if (!state.hasReachedMax) {
      if (servicesList.isEmpty) {
        emit(state.copyWith(status: DeafultBlocStatus.loading));
      }

      final data =
          await useCase.getServicesUseCase(maxResult: max, skipCount: skip);
      data.fold(
        (failure) => emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        )),
        (services) {
          if (services.isEmpty) {
            emit(state.copyWith(
                status: DeafultBlocStatus.done,
                hasReachedMax: true,
                services: servicesList));
            skip = 0;
          } else {
            servicesList.addAll(services);
            skip += 1;
            emit(state.copyWith(
                status: DeafultBlocStatus.done, services: servicesList));
          }
        },
      );
    }
  }
}
