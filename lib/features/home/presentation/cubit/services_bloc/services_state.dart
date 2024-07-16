part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<ItemModel> services;
  final bool hasReachedMax;

  const ServicesState({
    required this.hasReachedMax,
    required this.services,
    required this.status,
    required this.failureMessage,
  });

  factory ServicesState.initial() {
    return ServicesState(
        hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.loading,
        services: const []);
  }

  @override
  List<Object> get props => [failureMessage, status, services, hasReachedMax];

  ServicesState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    bool? hasReachedMax,
    List<ItemModel>? services,
  }) {
    return ServicesState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      services: services ?? this.services,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}