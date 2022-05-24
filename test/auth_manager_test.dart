import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('Log in user test: non initialized Firebase', () async {
    expect(
      () async {
        await AuthManager.instance.logInUser("", "", true);
      },
      throwsA(isA<Exception>()),
    );
  });

  test('Log in user test: non existing user', () async {
    await initFirebaseApp();

    String expectedResult = "No user found for that email.";
    String actualResult = await AuthManager.instance.logInUser(
      "non-existing-mail",
      "any-password",
      true,
    );

    expect(expectedResult, actualResult);
  });

  test('Log in user test: wrong password', () async {
    await initFirebaseApp();

    String expectedResult = "Wrong password provided.";
    String actualResult = await AuthManager.instance.logInUser(
      "mock_mail@gmail.com",
      "wrong-password",
      true,
    );

    expect(expectedResult, actualResult);
  });

  test('Log in user test: valid input', () async {
    await initFirebaseApp();

    String expectedResult = "Success";
    String actualResult = await AuthManager.instance.logInUser(
      "mock_mail@gmail.com",
      "password",
      true,
    );

    expect(expectedResult, actualResult);
  });
}
