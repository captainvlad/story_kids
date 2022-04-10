import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/backend_services/BackendUtils.dart';
import 'package:story_kids/models/media_content.dart';
import 'package:story_kids/models/plan.dart';

class ContentProvider {
  static String plansDirectory = "plans";
  static String mediaDirectory = "media";

  static String _lastTimeUpdated = "";
  static String changesFilename = "changes.json";

  static List<Plan> _plans = [];
  static List<MediaContent> _content = [];

  static Future initialize() async {
    if (await _shouldUpdate()) {
      _plans = await _downloadPlans();
      _content = await _downloadContent();
      _lastTimeUpdated = await _getLastModified();
    }
  }

  static Future<List<Plan>> getPlans() async {
    if (await _shouldUpdate()) {
      await initialize();
    }

    return _plans;
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
    ListResult storageContent = await FirebaseStorage.instance.ref().listAll();
    Uint8List? downloadedData = await storageContent.items
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

  // AAADIP may not be used
  // static Future<String> _updateModified() async {
  //   try {
  //     int currentTime = DateTime.now().millisecondsSinceEpoch;
  //     ListResult storageContent =
  //         await FirebaseStorage.instance.ref().listAll();

  //     Reference changesFile = storageContent.items.firstWhere(
  //       (element) => element.name == changesFilename,
  //     );

  //     changesFile.putString(
  //       '{"last_updated": "$currentTime"}',
  //     );

  //     return "Success";
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
}
