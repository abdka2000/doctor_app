part of 'patient_files_bloc.dart';

sealed class PatientFilesEvent extends Equatable {
  const PatientFilesEvent();

  @override
  List<Object> get props => [];
}

class GetUserFiles extends PatientFilesEvent {
  final bool isRefresh;

  const GetUserFiles({this.isRefresh = false});
}
