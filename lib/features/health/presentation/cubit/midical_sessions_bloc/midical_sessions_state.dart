part of 'midical_sessions_bloc.dart';

class MidicalSessionsState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Item> sessions;
  final bool hasReachedMax;

  const MidicalSessionsState({
    required this.sessions,
    required this.status,
    required this.failureMessage,
    required this.hasReachedMax,
  });

  factory MidicalSessionsState.initial() {
    return MidicalSessionsState(
        hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.loading,
        sessions: const []);
  }

  @override
  List<Object> get props => [failureMessage, status, sessions, hasReachedMax];

  MidicalSessionsState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<Item>? sessions,
    bool? hasReachedMax,
  }) {
    return MidicalSessionsState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        sessions: sessions ?? this.sessions,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
