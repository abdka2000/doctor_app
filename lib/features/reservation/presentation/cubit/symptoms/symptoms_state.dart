part of 'symptoms_cubit.dart';

class SymptomsState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final SymptomEntity symptoms;

  const SymptomsState({
    required this.symptoms,
    required this.status,
    required this.failureMessage,
  });

  factory SymptomsState.initial() {
    return SymptomsState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
      symptoms: SymptomEntity(),
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  SymptomsState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    SymptomEntity? symptoms,
  }) {
    return SymptomsState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      symptoms: symptoms ?? this.symptoms,
    );
  }
}
