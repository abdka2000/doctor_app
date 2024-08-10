part of 'notifications_bloc.dart';

class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class GetNotifications extends NotificationsEvent {
  final bool isRefresh;

  const GetNotifications({this.isRefresh = false});
}

class MakeNotifictionsReaded extends NotificationsEvent {}
