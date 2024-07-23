part of 'user_prescriptions_bloc.dart';

class UserPrescriptionState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Item> userPrescriptions;
  final bool hasReachedMax;

  const UserPrescriptionState({
    required this.userPrescriptions,
    required this.status,
    required this.failureMessage,
    required this.hasReachedMax,
  });

  factory UserPrescriptionState.initial() {
    return UserPrescriptionState(
        hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.loading,
        userPrescriptions: const []);
  }

  @override
  List<Object> get props =>
      [failureMessage, status, userPrescriptions, hasReachedMax];

  UserPrescriptionState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<Item>? userPrescriptions,
    bool? hasReachedMax,
  }) {
    return UserPrescriptionState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        userPrescriptions: userPrescriptions ?? this.userPrescriptions,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
