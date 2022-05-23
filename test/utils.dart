import 'package:flutter_test/flutter_test.dart';

Future<void> asyncWait({
  required WidgetTester tester,
  required int secondsTime,
}) async {
  await tester.runAsync(() async {
    await Future.delayed(Duration(seconds: secondsTime));
  });
}
