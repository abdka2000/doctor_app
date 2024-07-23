part of 'notifications_bloc.dart';


class NotificationsState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Item> notifications;
  final bool hasReachedMax;

  const NotificationsState({
    required this.hasReachedMax,
    required this.notifications,
    required this.status,
    required this.failureMessage,
  });

  factory NotificationsState.initial() {
    return NotificationsState(
        hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.loading,
        notifications: const []);
  }

  @override
  List<Object> get props =>
      [failureMessage, status, hasReachedMax, notifications];

  NotificationsState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<Item>? notifications,
    bool? hasReachedMax,
  }) {
    return NotificationsState(
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        notifications: notifications ?? this.notifications);
  }
}
