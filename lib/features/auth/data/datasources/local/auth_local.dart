import 'package:dartz/dartz.dart';
import '../../../../../core/shared/shared_pref.dart';

abstract class AuthLocal {
  Future<Unit> setToken({required String token});
}

class AuthLocalImpl implements AuthLocal {
  @override
  Future<Unit> setToken({required String token}) async {
    AppSharedPreferences.cashToke(token: token);
    return unit;
  }
}
