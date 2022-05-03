import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/models/client/user.dart';
import 'package:story_kids/ui/client/screens/universal/already_logged_screen.dart';
import 'package:story_kids/ui/client/screens/universal/home_screen.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';
import 'package:story_kids/ui/client/screens/universal/login_screen.dart';
import 'package:story_kids/ui/client/screens/universal/not_logged_screen.dart';
import 'package:story_kids/ui/client/screens/universal/not_payed_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';

import 'remote_content_provider.dart';

class NavigationManager {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void popScreen() {
    navigatorKey.currentState!.pop();
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

  static void pushNamed(String path, Map? arguments) {
    switch (path) {
      case LogInScreen.path:
        bool userAlreadyLogged = AuthManager.userLoggedIn();
        backToMain();

        if (userAlreadyLogged) {
          pushNamed(AlreadyLoggedScreen.path, arguments);
        } else {
          navigatorKey.currentState!.pushNamed(path, arguments: arguments);
        }

        break;
      case RegisterScreen.path:
        bool userAlreadyLogged = AuthManager.userLoggedIn();
        backToMain();

        if (userAlreadyLogged) {
          pushNamed(AlreadyLoggedScreen.path, arguments);
        } else {
          navigatorKey.currentState!.pushNamed(path, arguments: arguments);
        }

        break;
      case LibraryScreen.path:
        navigatorKey.currentState!
            .pushNamed(ProgressScreen.path, arguments: arguments);

        bool userAlreadyLogged = AuthManager.userLoggedIn();
        bool paymentSuccessful = UserModel.paymentSuccessful;
        // await PaymentManager.validateUserPayment()   AAADIP should be here
        backToMain();

        if (userAlreadyLogged && paymentSuccessful) {
          navigatorKey.currentState!.pushNamed(path, arguments: arguments);
        } else if (userAlreadyLogged && !paymentSuccessful) {
          navigatorKey.currentState!
              .pushNamed(NotPayedScreen.path, arguments: arguments);
        } else {
          navigatorKey.currentState!
              .pushNamed(NotLoggedScreen.path, arguments: arguments);
        }

        break;
      default:
        navigatorKey.currentState!.pushNamed(path, arguments: arguments);
        break;
    }
  }
}
