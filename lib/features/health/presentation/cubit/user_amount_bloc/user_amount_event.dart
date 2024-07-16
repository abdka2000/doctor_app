part of 'user_amount_bloc.dart';

sealed class UserAmountEvent extends Equatable {
  const UserAmountEvent();

  @override
  List<Object> get props => [];
}

class GetUserAmount extends UserAmountEvent {
  final bool isRefresh;

  const GetUserAmount({this.isRefresh = false});
}
