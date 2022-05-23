import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/remote_content_provider.dart';
import 'package:story_kids/models/client/abstract_request.dart';
import 'package:story_kids/models/client/plan.dart';
import 'package:story_kids/models/client/utils.dart';
import 'package:story_kids/models/client/user_model.dart';

class PaymentRequest extends AbstractRequest {
  late Plan userPlan;
  late String cardNumber;
  late String cardExpYear;
  late UserModel userModel;
  late String cardExpMonth;
  late String cardCvvNumber;

  Future<void> initialize(
    String cardNumberValue,
    String expiryDateValue,
    String cvvValue,
  ) async {
    cardNumber = cardNumberValue;
    cardExpMonth = expiryDateValue.substring(0, 2);
    cardExpYear = expiryDateValue.substring(3);
    cardCvvNumber = cvvValue;

    userModel = AuthManager.instance.user!;
    userPlan = (await RemoteContentProvider.instance.getPlanByName(
      userModel.chosenPlanName,
    ))!;

    type = "payment";
    credentials = await getCredentials();
  }

  @override
  Map<String, dynamic> toMap() {
    String transactionDate = Utils.getCurrentDate();
    String subscriptionStartDate = Utils.addDaysToCurrentDate(30);

    return {
      'type': type,
      'cvv': cardCvvNumber,
      'cardNumber': cardNumber,
      'userId': userModel.id,
      'yearExpired': cardExpYear,
      'monthExpired': cardExpMonth,
      'currency': userPlan.currency,
      'priceValue': userPlan.priceValue,
      'transactionDate': transactionDate,
      'planName': userModel.chosenPlanName,
      'subscribeDateStart': subscriptionStartDate,
      'paymentService': userModel.paymentService,
      'stripeSecretKey': '${credentials!["secret_key"]}',
      'liqpayPublicKey': '${credentials!["public_key"]}',
      'liqpayPrivateKey': '${credentials!["private_key"]}'
    };
  }
}
