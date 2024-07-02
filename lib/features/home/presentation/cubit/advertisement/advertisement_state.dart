// ignore_for_file: prefer_const_literals_to_create_immutables

part of 'advertisement_cubit.dart';

class AdvertisementState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<AdvItemModel> advs;

  const AdvertisementState({
    required this.advs,
    required this.status,
    required this.failureMessage,
  });

  factory AdvertisementState.initial() {
    return AdvertisementState(
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        advs: []);
  }

  @override
  List<Object> get props => [failureMessage, status];

  AdvertisementState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<AdvItemModel>? advs,
  }) {
    return AdvertisementState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        advs: advs ?? this.advs);
  }
}
