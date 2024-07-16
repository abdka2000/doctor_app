part of 'prescription_details_bloc.dart';

sealed class PrescriptionDetailsEvent extends Equatable {
  const PrescriptionDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetPrescriptionDetails extends PrescriptionDetailsEvent {
  final int prescriptionId;
  final bool isRefresh;

  const GetPrescriptionDetails(
      {required this.prescriptionId, this.isRefresh = false});
}
