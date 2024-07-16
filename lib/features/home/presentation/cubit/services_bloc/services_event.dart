part of 'services_bloc.dart';

sealed class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class GetServices extends ServicesEvent {
  final bool isRefresh;

  const GetServices({this.isRefresh = false});
}
