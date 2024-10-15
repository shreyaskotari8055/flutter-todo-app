import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/presentation/my_app.dart';
import 'di/service_locator.dart';
import 'firebase_options.dart';


Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService.init();
  // tz.initializeTimeZones();
  await setPreferredOrientations();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseApi().initNotification();

  await ServiceLocator.configureDependencies();

  runApp(MyApp());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
