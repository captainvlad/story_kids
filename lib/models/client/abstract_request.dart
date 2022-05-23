import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/managers/client/abstract_content_provider.dart';
import 'package:story_kids/managers/client/download_manager.dart';
import 'package:story_kids/models/client/enums.dart';

abstract class AbstractRequest {
  final String _stripeCredentialsPath = "config/stripe_credentials.json";
  final String _liqpayCredentialsPath = "config/liqpay_credentials.json";

  String type = "";
  Map<String, dynamic>? credentials;

  Map<String, dynamic> toMap() => {};

  Future<void> updateCredentials() async {
    credentials = null;
    await getCredentials();
  }

  Future<Map<String, dynamic>> getCredentials() async {
    if (credentials == null) {
      Map<String, dynamic> result = {};
      Map<String, dynamic> stripeCreds = await _getStripeCredentials();
      Map<String, dynamic> liqpayCreds = await _getLiqpayCredentials();

      result.addAll(liqpayCreds);
      result.addAll(stripeCreds);
      credentials = result;
    }

    return credentials!;
  }

  Future<Map<String, dynamic>> _getStripeCredentials() async {
    Reference fileRef =
        await DownloadManager.instance.fileByPath(_stripeCredentialsPath);

    return await DownloadManager.instance.refToJson(fileRef);
  }

  Future<Map<String, dynamic>> _getLiqpayCredentials() async {
    Reference fileRef =
        await DownloadManager.instance.fileByPath(_liqpayCredentialsPath);

    return await DownloadManager.instance.refToJson(fileRef);
  }
}
