part of 'download_bloc.dart';

sealed class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadFile extends DownloadEvent {
  final String url;
  final String name;

  const DownloadFile({required this.url, required this.name});
}
