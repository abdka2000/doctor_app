part of 'services_cubit.dart';

class ServicesState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<ItemModel> services;

  const ServicesState({
    required this.services,
    required this.status,
    required this.failureMessage,
  });

  factory ServicesState.initial() {
    return ServicesState(
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        services: []);
  }

  @override
  List<Object> get props => [failureMessage, status];

  ServicesState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<ItemModel>? services,
  }) {
    return ServicesState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        services: services ?? this.services);
  }
}
