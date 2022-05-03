import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/managers/client/backend_utils.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/models/client/plan.dart';

class ContentProvider {
  static String plansDirectory = "plans";
  static String mediaDirectory = "media";
  static String configDirectory = "config";

  static String _lastTimeUpdated = "";
  static String changesFilename = "changes.json";
  static String liqPayCredsFilename = "liqpay_credentials.json";
  static String stripeCredsFilename = "stripe_credentials.json";

  static List<Plan> _plans = [];
  static List<MediaContent> _content = [];
  static Map<String, dynamic> _liqPayCredentials = {};
  static Map<String, dynamic> _stripeCredentials = {};

  static Future initialize() async {
    if (await _shouldUpdate()) {
      _plans = await _downloadPlans();
      _content = await _downloadContent();
      _lastTimeUpdated = await _getLastModified();
      _liqPayCredentials = await getLiqPayCredentials();
      _stripeCredentials = await getStripeCredentials();
    }
  }

  static Future<List<Plan>> getPlans() async {
    if (await _shouldUpdate()) {
      await initialize();
    }

    return _plans;
  }

  static Future<Plan?> getPlanByName(String name) async {
    List<Plan> plans = await getPlans();
    Iterable<Plan> result = plans.where((element) => element.name == name);

    return result.isEmpty ? null : result.first;
  }

  static Future<List<MediaContent>> getContent() async {
    if (await _shouldUpdate()) {
      await initialize();
    }

    return _content;
  }

  static Future<bool> _shouldUpdate() async {
    return _lastTimeUpdated != await _getLastModified();
  }

  static Future<String> _getLastModified() async {
    ListResult allDirs = await FirebaseStorage.instance.ref().listAll();

    ListResult configDir = await allDirs.prefixes
        .firstWhere(
          (element) => element.name == configDirectory,
        )
        .listAll();

    Uint8List? downloadedData = await configDir.items
        .firstWhere(
          (element) => element.name == changesFilename,
        )
        .getData();

    return BackendUtils.bytesToLastModified(downloadedData);
  }

  static Future<List<Plan>> _downloadPlans() async {
    List<Plan> result = [];
    ListResult storageContent = await FirebaseStorage.instance.ref().listAll();

    ListResult plansFiles = await storageContent.prefixes
        .firstWhere(
          (element) => element.name == plansDirectory,
        )
        .listAll();

    List<Reference> validLocalePlans = plansFiles.items
        .where(
          (element) => BackendUtils.validLocale("en", element.name),
        )
        .toList();

    for (Reference r in validLocalePlans) {
      result.add(
        BackendUtils.bytesToPlan(await r.getData()),
      );
    }

    return result;
  }

  static Future<List<MediaContent>> _downloadContent() async {
    List<MediaContent> result = [];
    ListResult storageContent = await FirebaseStorage.instance.ref().listAll();

    ListResult contentFiles = await storageContent.prefixes
        .firstWhere(
          (element) => element.name == mediaDirectory,
        )
        .listAll();

    List<Reference> validLocaleContent = contentFiles.prefixes
        .where(
          (element) => BackendUtils.validLocale("en", element.name),
        )
        .toList();

    for (Reference r in validLocaleContent) {
      result.add(
        await BackendUtils.dirToContent(r),
      );
    }

    return result;
  }

  static Future<Map<String, dynamic>> getLiqPayCredentials() async {
    if (_stripeCredentials.isEmpty || await _shouldUpdate()) {
      ListResult allDirs = await FirebaseStorage.instance.ref().listAll();

      ListResult configDir = await allDirs.prefixes
          .firstWhere(
            (element) => element.name == configDirectory,
          )
          .listAll();

      Uint8List? downloadedData = await configDir.items
          .firstWhere(
            (element) => element.name == stripeCredsFilename,
          )
          .getData();

      _stripeCredentials = BackendUtils.bytesToJson(downloadedData);
    }

    return _stripeCredentials;
  }

  static Future<Map<String, dynamic>> getStripeCredentials() async {
    if (_liqPayCredentials.isEmpty || await _shouldUpdate()) {
      ListResult allDirs = await FirebaseStorage.instance.ref().listAll();

      ListResult configDir = await allDirs.prefixes
          .firstWhere(
            (element) => element.name == configDirectory,
          )
          .listAll();

      Uint8List? downloadedData = await configDir.items
          .firstWhere(
            (element) => element.name == liqPayCredsFilename,
          )
          .getData();

      _liqPayCredentials = BackendUtils.bytesToJson(downloadedData);
    }

    return _liqPayCredentials;
  }

  static Future<String> updateLiqPayCredentials(
    String publicKey,
    String privateKey,
  ) async {
    try {
      ListResult allDirs = await FirebaseStorage.instance.ref().listAll();

      ListResult configDir = await allDirs.prefixes
          .firstWhere(
            (element) => element.name == configDirectory,
          )
          .listAll();

      Reference changesFile = configDir.items.firstWhere(
        (element) => element.name == stripeCredsFilename,
      );

      await changesFile.putString(
        '{"public_key": "$publicKey", "private_key": "$privateKey"}',
      );

      await _updateLastModified();
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> updateStripeCredentials(String secretKey) async {
    try {
      ListResult allDirs = await FirebaseStorage.instance.ref().listAll();

      ListResult configDir = await allDirs.prefixes
          .firstWhere(
            (element) => element.name == configDirectory,
          )
          .listAll();

      Reference changesFile = configDir.items.firstWhere(
        (element) => element.name == liqPayCredsFilename,
      );

      await changesFile.putString(
        '{"secret_key": "$secretKey"}',
      );

      await _updateLastModified();
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> _updateLastModified() async {
    try {
      int currentTime = BackendUtils.getMilliseconds();

      ListResult allDirs = await FirebaseStorage.instance.ref().listAll();

      ListResult configDir = await allDirs.prefixes
          .firstWhere(
            (element) => element.name == configDirectory,
          )
          .listAll();

      Reference changesFile = configDir.items.firstWhere(
        (element) => element.name == changesFilename,
      );

      await changesFile.putString(
        '{"last_updated": "$currentTime"}',
      );

      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  // AAADIP create one unified method for getting reference and listreference from
  // path and put it in predcessor class
}
