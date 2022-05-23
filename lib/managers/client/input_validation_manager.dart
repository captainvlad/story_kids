import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputValidationManager {
  static Future<Map<String, dynamic>> validateForgotPassword(
    String inputValue,
    AppLocalizations currentLocale,
  ) async {
    Map<String, dynamic> result = {
      "valid": true,
      "description": "",
    };

    bool validUser = await AuthManager.instance.userWithMailExists(inputValue);

    if (!_validEmail(inputValue)) {
      result["valid"] = false;
      result["description"] = currentLocale.email_invalid;
    } else if (!validUser) {
      result["valid"] = false;
      result["description"] = currentLocale.no_user;
    }

    return result;
  }

  static Future<Map<String, dynamic>> validateLogin(
    String emailValue,
    String passwordValue,
    AppLocalizations currentLocale,
  ) async {
    Map<String, dynamic> result = {
      "valid": true,
      "description": "",
    };

    bool validUser = await AuthManager.instance.userWithMailExists(emailValue);

    if (!_validEmail(emailValue)) {
      result["valid"] = false;
      result["description"] = currentLocale.email_invalid;
    } else if (!_validPassword(passwordValue)) {
      result["valid"] = false;
      result["description"] = currentLocale.password_invalid;
    } else if (!validUser) {
      result["valid"] = false;
      result["description"] = currentLocale.no_user;
    }

    return result;
  }

  static Future<Map<String, dynamic>> validatePayment(
    String cardNumber,
    String expiryDate,
    String cardCvv,
    AppLocalizations currentLocale,
  ) async {
    Map<String, dynamic> result = {"valid": true, "description": ""};

    if (cardNumber.length < 18 || cardNumber.length > 19) {
      result["valid"] = false;
      result["description"] = currentLocale.card_number_invalid;
    } else if (cardCvv.length < 3) {
      result["valid"] = false;
      result["description"] = currentLocale.cvv_number_invalid;
    } else if (expiryDate.length < 5) {
      result["valid"] = false;
      result["description"] = currentLocale.date_number_invalid;
    }

    return result;
  }

  static Future<Map<String, dynamic>> validateRegister(
    bool anyPlanChosen,
    String userName,
    String name,
    String surname,
    String email,
    String password,
    AppLocalizations currentLocale,
  ) async {
    Map<String, dynamic> result = {
      "valid": true,
      "description": "",
    };

    if (!anyPlanChosen) {
      result["valid"] = false;
      result["description"] = currentLocale.no_plan;
    } else if (userName.isEmpty) {
      result["valid"] = false;
      result["description"] = currentLocale.username_invalid;
    } else if (name.isEmpty) {
      result["valid"] = false;
      result["description"] = currentLocale.name_invalid;
    } else if (surname.isEmpty) {
      result["valid"] = false;
      result["description"] = currentLocale.surname_invalid;
    } else if (email.isEmpty || !_validEmail(email)) {
      result["valid"] = false;
      result["description"] = currentLocale.email_invalid;
    } else if (password.length < 7) {
      result["valid"] = false;
      result["description"] = currentLocale.password_invalid;
    }

    return result;
  }

  static bool _validEmail(String inputValue) {
    final RegExp validEmailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return validEmailRegExp.hasMatch(inputValue);
  }

  static bool _validPassword(String inputValue) {
    return inputValue.length >= 7;
  }
}
