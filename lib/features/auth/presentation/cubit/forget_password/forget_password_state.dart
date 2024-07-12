part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const ForgetPasswordState({
    required this.failureMessage,
    required this.status,
  });

  factory ForgetPasswordState.intial() {
    return ForgetPasswordState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  ForgetPasswordState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ForgetPasswordState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
