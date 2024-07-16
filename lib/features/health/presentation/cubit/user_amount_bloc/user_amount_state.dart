part of 'user_amount_bloc.dart';


class UserAmountState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final UserAmountEntity userAmount;
  final bool hasReachedMax;
  final List<Item> items;

  const UserAmountState({
    required this.hasReachedMax,
    required this.items,
    required this.userAmount,
    required this.status,
    required this.failureMessage,
  });

  factory UserAmountState.initial() {
    return UserAmountState(
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.loading,
        userAmount: UserAmountEntity(),
        hasReachedMax: false,
        items: const []);
  }

  @override
  List<Object> get props => [
        failureMessage,
        status,
        userAmount,
        hasReachedMax,
        items,
      ];

  UserAmountState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    UserAmountEntity? userAmount,
    bool? hasReachedMax,
    List<Item>? items,
  }) {
    return UserAmountState(
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      items: items ?? this.items,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      userAmount: userAmount ?? this.userAmount,
    );
  }
}
