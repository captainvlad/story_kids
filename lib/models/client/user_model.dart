import 'package:firebase_auth/firebase_auth.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/models/client/check_request.dart';
import 'package:story_kids/managers/client/network_manager.dart';
import 'package:story_kids/models/client/payment_request.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/models/client/plan.dart';
import 'package:story_kids/models/client/update_request.dart';

class UserModel {
  String id;
  final String name;
  final String mail;
  final String surname;
  final String password;
  final String userName;
  final String chosenCategory;
  final String chosenPlanName;

  String paymentService;
  bool paymentSuccessful = false;

  UserModel({
    this.id = '0',
    required this.mail,
    required this.name,
    required this.surname,
    required this.userName,
    required this.password,
    required this.chosenPlanName,
    this.chosenCategory = 'defaultCategory',
    this.paymentService = "Stripe",
  });

  Future<void> updateUserPaymentStatus() async {
    CheckRequest request = CheckRequest();
    await request.initialize(this);

    Map<String, dynamic> result =
        await NetworkManager.instance.commitRequest(request);

    paymentSuccessful = result['status'] == 'success' ? true : false;
  }

  Future<Map<String, dynamic>> performUpdateOrPayment(
    String cardNumber,
    String expiryDate,
    String cardCvvNumber,
    String chosenPaymentTool,
  ) async {
    if (await _userSubscriptionCreated()) {
      var result = await _performUpdate(cardNumber, expiryDate, cardCvvNumber);
      return result;
    } else {
      AuthManager.instance.user!.paymentService = chosenPaymentTool;
      var result = await _performPayment(cardNumber, expiryDate, cardCvvNumber);
      return result;
    }
  }

  Future<bool> _userSubscriptionCreated() async {
    CheckRequest request = CheckRequest();
    await request.initialize(this);

    Map<String, dynamic> result =
        await NetworkManager.instance.commitRequest(request);

    return result['status'] != 'not_found';
  }

  Future<Map<String, dynamic>> _performPayment(
    String cardNumber,
    String expiryDate,
    String cardCvvNumber,
  ) async {
    PaymentRequest request = PaymentRequest();
    await request.initialize(
      cardNumber,
      expiryDate,
      cardCvvNumber,
    );

    return await NetworkManager.instance.commitRequest(request);
  }

  Future<Map<String, dynamic>> _performUpdate(
    String cardNumber,
    String expiryDate,
    String cardCvvNumber,
  ) async {
    UpdateRequest request = UpdateRequest();
    await request.initialize(
      cardNumber,
      expiryDate,
      cardCvvNumber,
    );

    return await NetworkManager.instance.commitRequest(request);
  }
}
