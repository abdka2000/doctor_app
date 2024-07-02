import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'core/shared/shared_pref.dart';
import 'injection/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(
    (pref) {
      AppSharedPreferences.init(pref);
      runApp(MyApp());
    },
  );
}
