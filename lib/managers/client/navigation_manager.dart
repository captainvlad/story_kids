import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/ui/client/screens/universal/already_logged_screen.dart';
import 'package:story_kids/ui/client/screens/universal/home_screen.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';
import 'package:story_kids/ui/client/screens/universal/login_screen.dart';
import 'package:story_kids/ui/client/screens/universal/not_logged_screen.dart';
import 'package:story_kids/ui/client/screens/universal/not_payed_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/client/screens/universal/success_screen.dart';

class NavigationManager {
  static final NavigationManager instance = NavigationManager._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigationManager._internal();

  void popScreen() {
    navigatorKey.currentState!.pop();
  }

  void refreshScreen(String path) {
    navigatorKey.currentState!.pop();
    navigatorKey.currentState!.pushNamed(path);
  }

  void backToMainScreen() {
    navigatorKey.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }

  void initHomeScreen(BuildContext context) {
    if (firstScreenIsHome(context)) {
      return;
    }

    navigatorKey.currentState!.pop();
    navigatorKey.currentState!.pushNamed(HomeScreen.path, arguments: null);
  }

  Future<void> pushNamed(String path, Map? arguments) async {
    switch (path) {
      case LogInScreen.path:
        _processLogInScreenTransition(arguments);
        break;
      case RegisterScreen.path:
        _processRegisterScreenTransition(arguments);
        break;
      case LibraryScreen.path:
        _processLibraryScreenTransition(arguments);
        break;
      case SuccessScreen.path:
        _processSuccessScreenTransition(arguments);
        break;
      default:
        navigatorKey.currentState!.pushNamed(path, arguments: arguments);
        break;
    }
  }

  void _processLogInScreenTransition(Map? arguments) {
    bool userAlreadyLogged = AuthManager.instance.userLoggedIn();
    backToMainScreen();

    if (userAlreadyLogged) {
      navigatorKey.currentState!
          .pushNamed(AlreadyLoggedScreen.path, arguments: arguments);
    } else {
      navigatorKey.currentState!
          .pushNamed(LogInScreen.path, arguments: arguments);
    }
  }

  void _processRegisterScreenTransition(Map? arguments) {
    bool userAlreadyLogged = AuthManager.instance.userLoggedIn();
    backToMainScreen();

    if (userAlreadyLogged) {
      navigatorKey.currentState!
          .pushNamed(AlreadyLoggedScreen.path, arguments: arguments);
    } else {
      navigatorKey.currentState!
          .pushNamed(RegisterScreen.path, arguments: arguments);
    }
  }

  void _processLibraryScreenTransition(Map? arguments) {
    navigatorKey.currentState!
        .pushNamed(ProgressScreen.path, arguments: arguments);

    bool userAlreadyLogged = AuthManager.instance.userLoggedIn();
    bool paymentSuccessful =
        AuthManager.instance.user?.paymentSuccessful ?? false;

    backToMainScreen();
    if (userAlreadyLogged && paymentSuccessful) {
      navigatorKey.currentState!
          .pushNamed(LibraryScreen.path, arguments: arguments);
    } else if (userAlreadyLogged && !paymentSuccessful) {
      navigatorKey.currentState!
          .pushNamed(NotPayedScreen.path, arguments: arguments);
    } else {
      navigatorKey.currentState!
          .pushNamed(NotLoggedScreen.path, arguments: arguments);
    }
  }

  void _processSuccessScreenTransition(Map? arguments) {
    backToMainScreen();
    navigatorKey.currentState!
        .pushNamed(SuccessScreen.path, arguments: arguments);
  }

  String? _getLastPath(BuildContext context) {
    ModalRoute? route = ModalRoute.of(context);
    return route?.settings.name;
  }

  bool firstScreenIsHome(BuildContext context) {
    ModalRoute? route = ModalRoute.of(context);
    bool routeIsFirst = route?.isFirst ?? false;

    return _getLastPath(context) == HomeScreen.path || !routeIsFirst;
  }
}
