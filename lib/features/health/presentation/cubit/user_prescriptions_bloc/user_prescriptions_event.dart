part of 'user_prescriptions_bloc.dart';

sealed class UserPrescriptionsEvent extends Equatable {
  const UserPrescriptionsEvent();

  @override
  List<Object> get props => [];
}

class GetUserPrescriptions extends UserPrescriptionsEvent {
  final bool isRefresh;

  const GetUserPrescriptions({this.isRefresh = false});
}
