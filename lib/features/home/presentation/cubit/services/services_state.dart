// ignore_for_file: prefer_const_literals_to_create_immutables

part of 'services_cubit.dart';

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
        status: DeafultBlocStatus.initial,
        services: []);
  }

  @override
  List<Object> get props => [failureMessage, status];

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
