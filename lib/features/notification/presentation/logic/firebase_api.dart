import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/app/my_app.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:toastification/toastification.dart';

class FirebaseApi {
  //Create instanse for firebase messaging:
  final _firebaseMessaging = FirebaseMessaging.instance;
  BuildContext? context = Context.navKey.currentContext;

  //Function to initialize notification:
  Future<void> initNotifications() async {
    //Request presmission from user(will prompt user):
    await _firebaseMessaging.requestPermission();

    //Fetch the token:
    final token = await _firebaseMessaging.getToken();

    //Print the token:
    if (kDebugMode) {
      print('token: $token');
    }

    //Init the function:
    initPushNotification();
  }

  //Function to handle recived messaging:
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    if (kDebugMode) {
      print('message click!');
    }
    if (context != null) {
      context!.read<ButtonNavCubit>().changeIndexButtonNav(2, context!);
    }

    // NavigationKey.navKey.currentState
    //     ?.push(MaterialPageRoute(builder: (context) => const SecondPage()));
  }

  //Function to handle background settings:
  Future<void> initPushNotification() async {
    //Handle notification if the app was terminated and now opened:
    _firebaseMessaging.getInitialMessage().then(handleMessage);

    //attach event listener for when a notification opens the app:
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    //Handle notification in foreground:
    FirebaseMessaging.onMessage.listen((message) {
      toastification.show(
          showProgressBar: false,
          title: const Text('تنبيه'),
          description: const Text("يوجد لديك إشعار جديد"),
          type: ToastificationType.info,
          style: ToastificationStyle.fillColored);
    });
  }
}
