part of 'doctor_info_cubit.dart';

class DoctorInfoState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final DoctorInfoEntity info;

  const DoctorInfoState({
    required this.info,
    required this.status,
    required this.failureMessage,
  });

  factory DoctorInfoState.initial() {
    return DoctorInfoState(
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        info: DoctorInfoEntity());
  }

  @override
  List<Object> get props => [failureMessage, status, info];

  DoctorInfoState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    DoctorInfoEntity? info,
  }) {
    return DoctorInfoState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        info: info ?? this.info);
  }
}
