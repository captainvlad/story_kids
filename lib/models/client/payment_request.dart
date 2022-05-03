import 'package:story_kids/managers/client/backend_utils.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/models/client/plan.dart';

class PaymentRequest {
  // Create new new predcessor class (ServerRequest) to be extended by
  // CheckRequest, PaymentRequest, UpdateRequest with needed fiedlds and
  // method toJsonString
  // Create Application class and use fucking SOLID principles AAADIP
  final PaymentTools paymentService;
  final String userId;
  late String currency;
  late String planName;
  late double priceValue;
  late String transactionDate;

  final String cardNumber;
  final String yearExpired;
  final String monthExpired;
  final String cvv;

  final String stripeSecretKey;
  final String liqPayPublicKey;
  final String liqPayPrivateKey;
  final String subscribeDateStart;

  PaymentRequest({
    required Plan plan,
    required this.userId,
    required this.cardNumber,
    required this.yearExpired,
    required this.monthExpired,
    required this.cvv,
    required this.paymentService,
    required this.stripeSecretKey,
    required this.liqPayPublicKey,
    required this.liqPayPrivateKey,
    required this.subscribeDateStart,
  }) {
    planName = plan.name;
    currency = plan.currency;

    priceValue = plan.priceValue;
    transactionDate = BackendUtils.getCurrentDate();
  }

  String toJsonString(String type) {
    return '''{
      'type': '$type',
      'paymentService': '$paymentService',
      'userId': '$userId',
      'currency': '$currency',
      'planName': '$planName',
      'priceValue': $priceValue,
      'transactionDate': '$transactionDate',
      'cardNumber': '$cardNumber',
      'yearExpired': '$yearExpired',
      'monthExpired': '$monthExpired',
      'cvv': '$cvv',
      'stripeSecretKey': '$stripeSecretKey',
      'liqPayPublicKey': '$liqPayPublicKey',
      'liqPayPrivateKey': '$liqPayPrivateKey',
      'subscribeDateStart': '$subscribeDateStart'
    }''';
  }

  // String toJsonString(String type) {
  //   return '''{
  //     'type': '$type',
  //     'paymentService': '$paymentService',
  //     'userId': '$userId',
  //     'planName': '$planName',
  //     'transactionDate': '$transactionDate',
  //     'cardNumber': '$cardNumber',
  //     'yearExpired': '$yearExpired',
  //     'monthExpired': '$monthExpired',
  //     'cvv': '$cvv',
  //     'stripeSecretKey': '$stripeSecretKey',
  //     'liqPayPublicKey': '$liqPayPublicKey',
  //     'liqPayPrivateKey': '$liqPayPrivateKey',
  //     'subscribeDateStart': '$subscribeDateStart'
  //   }''';
  // }
}
