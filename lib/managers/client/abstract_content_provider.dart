import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/managers/client/download_manager.dart';

class AbstractContentProvider {
  void releaseResources() {}

  Future<void> initResources() async {}

  Future<void> updateResources() async {}

  Future<String> getLastModified() async {
    const String lastModifiedPath = "config/changes.json";

    Reference lastModifiedRef =
        await DownloadManager.instance.fileByPath(lastModifiedPath);

    String lastModified =
        await DownloadManager.instance.refToLastModified(lastModifiedRef);

    return lastModified;
  }
}
