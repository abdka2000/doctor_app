part of 'edit_number_cubit.dart';

class EditNumberState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;

  const EditNumberState({
    required this.status,
    required this.failureMessage,
  });

  factory EditNumberState.initial() {
    return EditNumberState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  EditNumberState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return EditNumberState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
