//! all api links

//? Api GET
class ApiGet {
  //? Home
  static const getServices = 'services/app/Service/GetAllForMobile';
  static const getAdvs = 'services/app/Advertisement/GetAll';
  static const getDoctorInfo = 'services/app/AboutDoctor/GetAboutDoctor';
  //? Reservations
  static const getReservations = 'services/app/Appointment/GetAllForPatient';
  static const getAvailableTimes =
      'services/app/Day/GetAllAvailableTimesForDay';
  static const getWorkHours =
      'services/app/UserWorkHour/GetAllWorkHoursForDoctor';
  static const getAvailableDays = 'services/app/Day/GetAllAvailableDays';
  static const getSymptoms = 'services/app/Symptom/GetAll';
  //? Profile
  static const getProfileData = 'services/app/Patient/GetPatientProfile';
  //? Health
  static const getMedicalSession =
      'services/app/MedicalSession/GetAllForPatient';
  static const getPrescriptionItemDetails =
      'services/app/PrescriptionItem/GetAll';
  static const getUserPrescriptions =
      'services/app/Prescription/GetAllForPatient';
  static const getUserAmount =
      'services/app/PatientAccount/GetAllAccountsForPatient';
  static const getFiles = 'services/app/PatientAttachmnet/GetAllForPatient';
}
//?

//? Api POST
class ApiPost {
  //? Auth
  static const sendLink = 'services/app/Account/ResendCode';
  static const createAccount = 'services/app/Account/RegisterPatient';
  static const login = 'TokenAuth/AuthenticatePatient';
  static const confirmPatientAccount =
      'services/app/Account/ConfirmPatientAccount';
  //? Profile
  static const sendEditPhoneNumber =
      'services/app/Patient/SendConfirmationCodeForEditNumber';
  static const confirmEditPhoneNumber =
      'services/app/Patient/SendConfirmationCodeForEditNumber';
  static const changePassword = 'services/app/Patient/ChangePassword';
  //? Reservations
  static const createAppoinment =
      'services/app/Appointment/CreateAppointmentByPatient';
}
//

//? Api PUT
class ApiPut {
  //? Profile
  static const updateProfile = 'services/app/Patient/UpdatePatientProfile';
}
//

//? Api DELETE
class ApiDelete {
  static const deleteAccount = 'services/app/Patient/DeletePatientAccount';
}

//
