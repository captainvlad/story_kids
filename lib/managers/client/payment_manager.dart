import 'dart:convert';
import 'package:http/http.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/remote_content_provider.dart';
import 'package:story_kids/models/client/payment_request.dart';

class PaymentManager {
  static String url = "http://localhost:8080/";

  static makePayment(PaymentRequest payment) async {
    try {
      var response = await post(
        Uri.parse(url),
        headers: {
          "Content-Type": "text/*",
        },
        body: payment.toJsonString('payment'),
        encoding: Encoding.getByName("utf-8"),
      );

      print("Response is: ${response.body}");
    } on ClientException catch (e) {
      print("Error is ${e.message}");
      print("URI is: ${e.uri}");
    } catch (e) {
      print("Other error is: ${e.runtimeType}");
    }
  }

  static makeUpdate(PaymentRequest payment) async {
    try {
      var response = await post(
        Uri.parse(url),
        headers: {
          "Content-Type": "text/*",
        },
        body: payment.toJsonString('update'),
        encoding: Encoding.getByName("utf-8"),
      );

      print("Response is: ${response.body}");
    } on ClientException catch (e) {
      print("Error is ${e.message}");
      print("URI is: ${e.uri}");
    } catch (e) {
      print("Other error is: ${e.runtimeType}");
    }
  }

  static Future<bool> validateUserPayment() async {
    try {
      var response = await post(
        Uri.parse(url),
        headers: {
          "Content-Type": "text/*",
        },
        body: await _generateCheckBody(),
        encoding: Encoding.getByName("utf-8"),
      );

      String resBodyFormatted = response.body.replaceAll("'", '"');
      Map<String, dynamic> jsonResponse = jsonDecode(resBodyFormatted);

      return jsonResponse['user_exists'] == 'true' ? true : false;
    } catch (e) {
      print("Error type is: ${e.runtimeType}");
      return false;
    }
  }

  static Future<String> _generateCheckBody() async {
    String userId = await AuthManager.getUserId();

    Map<String, dynamic> stripeCreds =
        await ContentProvider.getStripeCredentials();

    Map<String, dynamic> liqPayCreds =
        await ContentProvider.getLiqPayCredentials();

    return """{
      'userId': '$userId',
      'liqPayPublicKey': '${liqPayCreds['public_key']}',
      'liqPayPrivateKey': '${liqPayCreds['private_key']}',
      'stripeSecretKey': '${stripeCreds['secret_key']}',
      'type': 'check'
    }""";
  }
}
