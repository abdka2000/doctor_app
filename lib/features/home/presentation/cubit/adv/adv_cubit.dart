import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';
import '../../../data/models/doctor_adv/adv_item_model.dart';
import '../../../domain/usecases/home_base_usecase.dart';

part 'adv_state.dart';

class AdvCubit extends Cubit<AdvState> {
  AdvCubit(this.useCase) : super(AdvState.initial());
  final HomeBaseUseCase useCase;
  Future<void> getAdvs() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getAdvsUseCase();
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (advs) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          advs: advs,
        ));
      },
    );
  }
}
