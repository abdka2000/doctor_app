// ignore_for_file: prefer_const_literals_to_create_immutables

part of 'times_for_day_cubit.dart';

class TimesForDayState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Result> times;

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
  List<Object> get props => [failureMessage, status, times];

  TimesForDayState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<Result>? times,
  }) {
    return TimesForDayState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      times: times ?? this.times,
    );
  }
}
