import 'dart:html';

import 'package:intl/intl.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/preference_content_provider.dart';

class Utils {
  static String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    return formatter.format(now);
  }

  static String addDaysToCurrentDate(int days) {
    var futureDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + days,
    );

    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(futureDate);
  }

  static int getMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static bool validLocale(String localeCode, String filename) {
    int lastIndex = filename.lastIndexOf('_');
    return filename.substring(lastIndex + 1, lastIndex + 3) == localeCode;
  }

  static void Function(Event)? onUnloadListener = (event) async {
    await PreferenceProvider.instance.saveUserCreds(
      AuthManager.instance.user?.mail,
      AuthManager.instance.user?.password,
    );
  };
}
