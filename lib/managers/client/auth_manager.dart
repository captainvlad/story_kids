import 'package:firebase_auth/firebase_auth.dart';
import 'package:story_kids/managers/client/preference_content_provider.dart';
import 'package:story_kids/models/client/user_model.dart';
import 'package:story_kids/managers/client/user_storage_manager.dart';

class AuthManager {
  static final AuthManager instance = AuthManager._internal();
  UserModel? user;

  AuthManager._internal();
  bool userLoggedIn() => user != null;

  Future<void> initializeFromPrefs() async {
    List<String> userCreds = await PreferenceProvider.instance.getUserCreds();

    if (userCreds.isNotEmpty) {
      await logInUser(userCreds[0], userCreds[1], true);
    }
  }

  Future<String> logInUser(
    String email,
    String password,
    bool rememberMe,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.setPersistence(
      rememberMe ? Persistence.SESSION : Persistence.LOCAL,
    );

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = await UserStorageManager.instance.getUserByMail(email);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided.';
      } else {
        return e.message ?? "Unknown error happened";
      }
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<String> registerUser(
    String name,
    String username,
    String surname,
    String email,
    String password,
    String chosenPlanName,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = await UserStorageManager.instance.addUser(
        UserModel(
          mail: email,
          name: name,
          surname: surname,
          password: password,
          userName: username,
          chosenPlanName: chosenPlanName,
        ),
      );

      return "Success";
    } catch (e) {
      return "Unknown error: ${e.toString()}";
    }
  }

  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
    user = null;
  }

  Future<bool> userWithMailExists(String email) async {
    try {
      var users = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return users.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<String> restoreUserPassword(String emailValue) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailValue);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
}
