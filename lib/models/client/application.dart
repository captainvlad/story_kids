import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Application {
  static final Application instance = Application._internal();

  bool initialized = false;
  bool firebaseAppInitialized = false;

  Application._internal();

  Future<void> initialize() async {
    if (!initialized) {
      initialized = true;
      WidgetsFlutterBinding.ensureInitialized();
      await _initFirebaseApp();
    }
  }

  Future<void> release() async {
    initialized = false;
  }

  Future<void> _initFirebaseApp() async {
    // MARK: SECURE INFORMATION: firebaseApp
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "*****************",
        authDomain: "*************",
        databaseURL: "************",
        projectId: "**************",
        storageBucket: "**********",
        messagingSenderId: "******",
        appId: "******************",
        measurementId: "**********",
      ),
    );
  }
}
