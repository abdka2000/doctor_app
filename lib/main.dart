import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hosptel_app/features/notification/presentation/logic/firebase_api.dart';
import 'app/my_app.dart';
import 'core/shared/shared_pref.dart';
import 'injection/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseApi().initNotifications();
  SharedPreferences.getInstance().then(
    (pref) {
      AppSharedPreferences.init(pref);
      runApp(MyApp());
    },
  );
}
