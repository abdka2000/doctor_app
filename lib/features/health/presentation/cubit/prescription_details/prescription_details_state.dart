// ignore_for_file: prefer_const_literals_to_create_immutables

part of 'prescription_details_cubit.dart';

class PrescriptionDetailsState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<Item>? prescriptionDetails;
  final bool hasReachedMax;

  const PrescriptionDetailsState({
    required this.prescriptionDetails,
    required this.status,
    required this.failureMessage,
    required this.hasReachedMax,
  });

  factory PrescriptionDetailsState.initial() {
    return PrescriptionDetailsState(
        hasReachedMax: false,
        failureMessage: FailureMessage(message: '', statusCode: 0),
        status: DeafultBlocStatus.initial,
        prescriptionDetails: []);
  }

  @override
  List<Object> get props => [failureMessage, status];

  PrescriptionDetailsState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<Item>? prescriptionDetails,
    bool? hasReachedMax,
  }) {
    return PrescriptionDetailsState(
        failureMessage: failureMessage ?? this.failureMessage,
        status: status ?? this.status,
        prescriptionDetails: prescriptionDetails ?? this.prescriptionDetails,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
