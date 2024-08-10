part of 'login_cubit.dart';

class LoginState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const LoginState({
    required this.failureMessage,
    required this.status,
  });
  factory LoginState.intial() {
    return LoginState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];
  LoginState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return LoginState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
