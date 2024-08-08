part of 'login_cubit.dart';

class LoginState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final bool isConfirmed;
  const LoginState({
    required this.isConfirmed,
    required this.failureMessage,
    required this.status,
  });
  factory LoginState.intial() {
    return LoginState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
      isConfirmed: false,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];
  LoginState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    bool? isConfirmed,
  }) {
    return LoginState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }
}
