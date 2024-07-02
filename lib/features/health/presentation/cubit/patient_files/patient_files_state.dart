part of 'patient_files_cubit.dart';

class PatientFilesState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Item> files;
  final bool hasReachedMax;

  const PatientFilesState({
    required this.files,
    required this.status,
    required this.failureMessage,
    required this.hasReachedMax,
  });

  factory PatientFilesState.initial() {
    return PatientFilesState(
        hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        files: []);
  }

  @override
  List<Object> get props => [failureMessage, status, hasReachedMax, files];

  PatientFilesState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<Item>? files,
    bool? hasReachedMax,
  }) {
    return PatientFilesState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        files: files ?? this.files,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
