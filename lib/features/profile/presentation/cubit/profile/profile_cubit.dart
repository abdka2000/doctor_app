import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.useCase) : super(ProfileState.initial());
  final ProfileBaseUseCase useCase;
  Future<void> getPersonData() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final person = await useCase.getProfileData();
    person.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (person) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
          person: person,
        ));
      },
    );
  }
}
