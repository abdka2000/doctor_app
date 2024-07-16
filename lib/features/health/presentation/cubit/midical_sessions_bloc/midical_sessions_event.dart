part of 'midical_sessions_bloc.dart';

sealed class MidicalSessionsEvent extends Equatable {
  const MidicalSessionsEvent();

  @override
  List<Object> get props => [];
}

class GetUserMidicalSessions extends MidicalSessionsEvent {
  final bool isRefresh;

  const GetUserMidicalSessions({this.isRefresh = false});
}
