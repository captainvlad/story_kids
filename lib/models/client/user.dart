import 'package:story_kids/managers/client/payment_manager.dart';

class UserModel {
  static bool paymentSuccessful = false;

  static Future initializeUser() async {
    await updateUserPaymentStatus();
  }

  static updateUserPaymentStatus() async {
    paymentSuccessful = await PaymentManager.validateUserPayment();
  }
}
