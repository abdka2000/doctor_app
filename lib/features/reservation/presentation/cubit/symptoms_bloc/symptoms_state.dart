part of 'symptoms_bloc.dart';

class SymptomsState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Item> items;
  final bool hasReachedMax;

  const SymptomsState({
    required this.hasReachedMax,
    required this.items,
    required this.status,
    required this.failureMessage,
  });

  factory SymptomsState.initial() {
    return SymptomsState(
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.loading,
        items: const [],
        hasReachedMax: false);
  }

  @override
  List<Object> get props => [failureMessage, status , items,hasReachedMax];

  SymptomsState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    bool? hasReachedMax,
    List<Item>? items,
  }) {
    return SymptomsState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}