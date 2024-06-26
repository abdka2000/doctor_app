part of 'confirm_edit_number_cubit.dart';

class ConfirmEditNumberState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;

  const ConfirmEditNumberState({
    required this.status,
    required this.failureMessage,
  });

  factory ConfirmEditNumberState.initial() {
    return ConfirmEditNumberState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  ConfirmEditNumberState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ConfirmEditNumberState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
