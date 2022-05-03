import 'dart:convert';
import 'package:http/http.dart';

class ServerUtilsManager {
  static String serverUrl = "http://localhost:8080/";

  static Future<Map<String, dynamic>> userAlreadySubscribed(
    String userId,
    String liqPayPublicKey,
    String liqPayPrivateKey,
    String stripeSecretKey,
  ) async {
    try {
      var response = await post(
        Uri.parse(serverUrl),
        headers: {
          "Content-Type": "text/*",
        },
        body: checkRequestToJson(
          userId,
          liqPayPublicKey,
          liqPayPrivateKey,
          stripeSecretKey,
        ),
        encoding: Encoding.getByName("utf-8"),
      );

      print("Response is: ${response.body}");
    } catch (e) {
      print("Other error is: ${e.runtimeType}");
    } finally {
      return {};
    }
  }

  static String checkRequestToJson(
    String userId,
    String liqPayPublicKey,
    String liqPayPrivateKey,
    String stripeSecretKey,
  ) {
    return '''{
      'type': 'check',
      'userId': '$userId',
      'liqPayPublicKey': '$liqPayPublicKey',
      'liqPayPrivateKey': '$liqPayPrivateKey',
      'stripeSecretKey': '$stripeSecretKey'
    }''';
  }
}
