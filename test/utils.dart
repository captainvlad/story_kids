import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> asyncWait({
  required WidgetTester tester,
  required int secondsTime,
}) async {
  await tester.runAsync(() async {
    await Future.delayed(Duration(seconds: secondsTime));
  });
}

Future<void> initFirebaseApp() async {
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
