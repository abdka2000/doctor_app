part of 'reservation_cubit.dart';

class ReservationState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<ReservationItemEntity> reservations;

  const ReservationState({
    required this.reservations,
    required this.status,
    required this.failureMessage,
  });

  factory ReservationState.initial() {
    return ReservationState(
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
  }) {
    return ReservationState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        reservations: reservations ?? this.reservations);
  }
}
