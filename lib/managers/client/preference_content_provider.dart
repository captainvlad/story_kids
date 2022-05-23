import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static final PreferenceProvider instance = PreferenceProvider._internal();
  PreferenceProvider._internal();

  Future<List<String>> getUserCreds() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? usermail = _prefs.getString("usermail");
    String? password = _prefs.getString("password");

    if (usermail == null || password == null) {
      return [];
    }

    await _prefs.clear();
    return [usermail, password];
  }

  Future<void> saveUserCreds(String? usermail, String? password) async {
    if (usermail == null || password == null) {
      return;
    }

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString("usermail", usermail);
    await _prefs.setString("password", password);
  }
}
