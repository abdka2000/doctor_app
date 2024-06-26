part of 'adv_cubit.dart';

class AdvState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<AdvItemModel> advs;

  const AdvState({
    required this.advs,
    required this.status,
    required this.failureMessage,
  });

  factory AdvState.initial() {
    return AdvState(
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        advs: []);
  }

  @override
  List<Object> get props => [failureMessage, status];

  AdvState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<AdvItemModel>? advs,
  }) {
    return AdvState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        advs: advs ?? this.advs);
  }
}
