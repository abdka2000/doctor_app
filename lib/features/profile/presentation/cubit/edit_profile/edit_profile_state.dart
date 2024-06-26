part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;

  const EditProfileState({
    required this.status,
    required this.failureMessage,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  EditProfileState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return EditProfileState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
