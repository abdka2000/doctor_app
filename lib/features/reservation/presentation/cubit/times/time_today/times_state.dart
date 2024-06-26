part of 'times_cubit.dart';

class TimesState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<AvailableTimes> times;

  const TimesState({
    required this.times,
    required this.status,
    required this.failureMessage,
  });

  factory TimesState.initial() {
    return TimesState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
      times: [],
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  TimesState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<AvailableTimes>? times,
  }) {
    return TimesState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      times: times ?? this.times,
    );
  }
}
