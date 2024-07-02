part of 'user_amount_cubit.dart';

class UserAmountState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final UserAmountEntity userAmount;

  const UserAmountState({
    required this.userAmount,
    required this.status,
    required this.failureMessage,
  });

  factory UserAmountState.initial() {
    return UserAmountState(
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        userAmount: UserAmountEntity());
  }

  @override
  List<Object> get props => [failureMessage, status];

  UserAmountState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    UserAmountEntity? userAmount,
    bool? hasReachedMax,
  }) {
    return UserAmountState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      userAmount: userAmount ?? this.userAmount,
    );
  }
}
