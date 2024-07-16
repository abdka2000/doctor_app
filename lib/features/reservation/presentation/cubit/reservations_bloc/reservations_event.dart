part of 'reservations_bloc.dart';

class ReservationsEvent extends Equatable {
  const ReservationsEvent();

  @override
  List<Object> get props => [];
}

class GetReservations extends ReservationsEvent {
  final bool isFinished;
  final bool isRefresh;

  const GetReservations({required this.isFinished, this.isRefresh = false});
}
