import 'package:flutter/material.dart';
import 'package:story_kids/screens/universal/home_screen.dart';

class NavigationManager {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void popScreen() {
    navigatorKey.currentState!.pop();
  }

  static void pushNamed(String path, Map? arguments) {
    navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  static void refreshScreen(String path) {
    navigatorKey.currentState!.pop();
    navigatorKey.currentState!.pushNamed(path);
  }

  static void backToMain() {
    NavigationManager.navigatorKey.currentState!.popUntil(
      (route) => route.isFirst,
    );

    popScreen();
    pushNamed(HomeScreen.path, null);
  }
}
