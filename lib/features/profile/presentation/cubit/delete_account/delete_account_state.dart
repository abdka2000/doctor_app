part of 'delete_account_cubit.dart';

class DeleteAccountState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;

  const DeleteAccountState({
    required this.status,
    required this.failureMessage,
  });

  factory DeleteAccountState.initial() {
    return DeleteAccountState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  DeleteAccountState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return DeleteAccountState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
