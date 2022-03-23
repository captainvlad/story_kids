import 'package:flutter/material.dart';

class NavigationManager {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void pushNamed(String path, Map? arguments) {
    if (arguments == null) {
      navigatorKey.currentState!.pushNamed(path);
    } else {
      navigatorKey.currentState!.pushNamed(path, arguments: arguments);
    }
  }

  static void refreshScreen(String path) {
    navigatorKey.currentState!.pop();
    navigatorKey.currentState!.pushNamed(path);
  }

  static void popToFirst() {
    NavigationManager.navigatorKey.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }

  static void popScreen({int times = 1}) {
    for (int i = 0; i < times; i++) {
      navigatorKey.currentState!.pop();
    }
  }
}
