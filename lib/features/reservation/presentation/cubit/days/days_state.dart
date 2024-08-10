// ignore_for_file: prefer_const_literals_to_create_immutables

part of 'days_cubit.dart';

class DaysState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Result> days;

  const DaysState({
    required this.days,
    required this.status,
    required this.failureMessage,
  });

  factory DaysState.initial() {
    return DaysState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
      days: [],
    );
  }

  @override
  List<Object> get props => [failureMessage, status, days];

  DaysState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<Result>? days,
  }) {
    return DaysState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      days: days ?? this.days,
    );
  }
}
