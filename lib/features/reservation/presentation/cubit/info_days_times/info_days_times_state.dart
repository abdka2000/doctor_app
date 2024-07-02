part of 'info_days_times_cubit.dart';

class InfoDaysTimesState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final UserWorkHours hours;

  const InfoDaysTimesState({
    required this.hours,
    required this.status,
    required this.failureMessage,
  });

  factory InfoDaysTimesState.initial() {
    return InfoDaysTimesState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
      hours: UserWorkHours(),
    );
  }

  @override
  List<Object> get props => [failureMessage, status, hours];

  InfoDaysTimesState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    UserWorkHours? hours,
  }) {
    return InfoDaysTimesState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      hours: hours ?? this.hours,
    );
  }
}
