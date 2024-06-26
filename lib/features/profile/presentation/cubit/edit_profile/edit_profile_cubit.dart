import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/entities/person.dart';
import 'package:hosptel_app/features/profile/domain/usecases/profile_base_use_case.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.useCase) : super(EditProfileState.initial());
  final ProfileBaseUseCase useCase;
  Future<void> editProfile({required Person person}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.editProfile(person);
    data.fold(
      (failure) {
        emit(state.copyWith(
          failureMessage: mapFailureToMessage(failure: failure),
          status: DeafultBlocStatus.error,
        ));
      },
      (done) {
        emit(state.copyWith(
          status: DeafultBlocStatus.done,
        ));
      },
    );
  }
}
