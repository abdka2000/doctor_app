import 'package:hosptel_app/features/health/data/models/midical_session_model/appointment_start_time.dart';
import 'package:hosptel_app/features/health/domain/entities/midical_session/appoinment_start_time.dart';

class MidicalSession {
  final int? id;
  final DateTime? creationTime;
  final AppointmentStartTime? appointmentStartTime;

  MidicalSession(
      {required this.id,
      required this.creationTime,
      required this.appointmentStartTime});
}
