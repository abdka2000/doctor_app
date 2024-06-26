part of 'reservation_cubit.dart';

class ReservationState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<ReservationItemEntity> reservations;
  final bool hasReachedMax;

  const ReservationState({
    required this.hasReachedMax,
    required this.reservations,
    required this.status,
    required this.failureMessage,
  });

  factory ReservationState.initial() {
    return ReservationState(
      hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        reservations: []);
  }

  @override
  List<Object> get props => [failureMessage, status];

  ReservationState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<ReservationItemEntity>? reservations,
    bool? hasReachedMax,
  }) {
    return ReservationState(
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        reservations: reservations ?? this.reservations);
  }
}
