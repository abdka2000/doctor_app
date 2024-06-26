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
  Future<void> getServices() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getServicesUseCase();
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (services) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          services: services,
        ));
      },
    );
  }
}
