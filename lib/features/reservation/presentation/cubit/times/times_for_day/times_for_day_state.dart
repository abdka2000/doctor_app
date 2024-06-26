part of 'times_for_day_cubit.dart';

class TimesForDayState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<AvailableTimes> times;

  const TimesForDayState({
    required this.times,
    required this.status,
    required this.failureMessage,
  });

  factory TimesForDayState.initial() {
    return TimesForDayState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
      times: [],
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  TimesForDayState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<AvailableTimes>? times,
  }) {
    return TimesForDayState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      times: times ?? this.times,
    );
  }
}
