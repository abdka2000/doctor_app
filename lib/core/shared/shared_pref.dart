import '../resources/keys_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences; // instance

  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

  static clear() {
    _sharedPreferences.clear();
  }

  //? Make Logout And Clear All The Keys And All Values Stored
  static void logoutSharedPreferences() {
    _sharedPreferences.clear();
  }

  //! Start Cash Sheard Pref : //!
  //? Cash Token :
  static void cashToke({required String token}) {
    _sharedPreferences.setString(AppKeysManger.token, token);
  }

  static void cashUserName({
    required String name,
  }) {
    _sharedPreferences.setString(AppKeysManger.name, name);
  }

  static void cashPhoneNumber({required String phoneNumber}) {
    _sharedPreferences.setString(AppKeysManger.phone, phoneNumber);
  }
  //! Finish Cash Sheard //!

  //! Start Get Sheard Pref //!

  static String getToken() {
    return _sharedPreferences.getString(AppKeysManger.token) ?? "";
  }

  static String getNumber() {
    return _sharedPreferences.getString(AppKeysManger.phone) ?? "";
  }

  static String getName() {
    return _sharedPreferences.getString(AppKeysManger.name) ?? "";
  }

  //! End Get Sheard Pref //!
}
