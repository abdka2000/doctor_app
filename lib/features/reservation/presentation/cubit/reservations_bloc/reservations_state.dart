part of 'reservations_bloc.dart';


class ReservationsState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<ReservationItemEntity> reservations;
  final bool hasReachedMax;

  const ReservationsState({
    required this.hasReachedMax,
    required this.reservations,
    required this.status,
    required this.failureMessage,
  });

  factory ReservationsState.initial() {
    return ReservationsState(
        hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.loading,
        reservations: const []);
  }

  @override
  List<Object> get props =>
      [failureMessage, status, hasReachedMax, reservations];

  ReservationsState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<ReservationItemEntity>? reservations,
    bool? hasReachedMax,
  }) {
    return ReservationsState(
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        reservations: reservations ?? this.reservations);
  }
}
