import 'package:firebase_storage/firebase_storage.dart';
import 'package:story_kids/managers/client/download_manager.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('Download test: non initialized Firebase', () async {
    expect(
      () async {
        await DownloadManager.instance.dirByPath("/path");
      },
      throwsA(isA<Exception>()),
    );
  });

  test('Download test: non-existing directory', () async {
    await initFirebaseApp();

    expect(
      () async {
        await DownloadManager.instance.dirByPath("/non-existing-dir");
      },
      throwsA(isA<Exception>()),
    );
  });

  test('Download test: valid path', () async {
    await initFirebaseApp();

    ListResult result = await DownloadManager.instance.dirByPath("/media");
    print("Result is: $result");
  });
}
