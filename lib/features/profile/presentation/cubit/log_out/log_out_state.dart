part of 'log_out_cubit.dart';


class LogOutState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;

  const LogOutState({
    required this.status,
    required this.failureMessage,
  });

  factory LogOutState.initial() {
    return LogOutState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  LogOutState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return LogOutState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
