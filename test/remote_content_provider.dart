import 'package:story_kids/managers/client/remote_content_provider.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('LocalContentProvider init test: non initialized Firebase', () async {
    expect(
      () async {
        await RemoteContentProvider.instance.initResources();
      },
      throwsA(isA<Exception>()),
    );
  });

  test('Download test: initialized Firebase', () async {
    await initFirebaseApp();
    await RemoteContentProvider.instance.initResources();

    await RemoteContentProvider.instance.plans;
    await RemoteContentProvider.instance.content;
  });
}
