part of 'download_bloc.dart';


class DownloadState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;

  const DownloadState({
    required this.status,
    required this.failureMessage,
  });

  factory DownloadState.initial() {
    return DownloadState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  DownloadState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return DownloadState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
