import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/models/client/user.dart';

class AuthManager {
  static User? user;

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  static Future<String> logInUser(
    String login,
    String password,
    bool rememberMe,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: login,
        password: password,
      );

      if (rememberMe) {
        rememberUser();
      }

      user = userCredential.user;
      await UserModel.initializeUser(); // AAADIP remove later
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
      return e.toString();
    }
  }

  static Future<String> registerUser(
    String username,
    String email,
    String password,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user?.updateDisplayName(username);
      await user?.reload();

      user = auth.currentUser;
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
    user = null;
  }

  static bool userLoggedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser?.uid == null ? false : true;
  }

  static void rememberUser() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.setPersistence(Persistence.SESSION);
  }

  static Future<String> getUserId() async {
    return await user?.getIdToken() ?? "-";
  }

  static Future<bool> userWithMailExists(String email) async {
    try {
      var list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return list.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
