part of 'send_code_cubit.dart';

class SendCodeState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const SendCodeState({
    required this.failureMessage,
    required this.status,
  });

  factory SendCodeState.intial() {
    return SendCodeState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  SendCodeState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return SendCodeState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
