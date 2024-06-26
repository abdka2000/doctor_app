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
  //! Finish Cash Sheard //!

  //! Start Get Sheard Pref //!

  static String getToken() {
    return _sharedPreferences.getString(AppKeysManger.token) ?? "";
  }
  //! End Get Sheard Pref //!
}
