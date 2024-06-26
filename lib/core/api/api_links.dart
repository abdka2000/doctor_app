//! all api links

//? Api GET
class ApiGet {
  //? Home
  static const getServices = 'services/app/Service/GetAllForMobile';
  static const getAdvs = 'services/app/Advertisement/GetAll';
  //? Reservations
  static const getReservations = 'services/app/Appointment/GetAllForPatient';
  static const getAvailableTimes =
      'services/app/Day/GetAllAvailableTimesForDay';
  static const getAvailableDays = 'services/app/Day/GetAllAvailableDays';
  //? Profile
  static const getProfileData = 'services/app/Patient/GetPatientProfile';
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
}
//

//? Api PUT
class ApiPut {
  //? Profile
  static const updateProfile = 'services/app/Patient/UpdatePatientProfile';
}
//

//? Api DELETE
class ApiDelete {}

//
