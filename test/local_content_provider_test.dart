import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('LocalContentProvider init test: non initialized Firebase', () async {
    expect(
      () async {
        await LocalContentProvider.instance.initResources();
      },
      throwsA(isA<Exception>()),
    );
  });

  test('Download test: initialized Firebase', () async {
    await initFirebaseApp();
    await LocalContentProvider.instance.initResources();

    LocalContentProvider.instance.homeScreen1!;
    LocalContentProvider.instance.homeScreenSample1!;
  });
}
