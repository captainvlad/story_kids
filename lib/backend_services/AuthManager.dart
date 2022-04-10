import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthManager {
  static User? user;

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  static Future<String> loginUser(String login, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: login,
        password: password,
      );

      user = userCredential.user;
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
      user?.sendEmailVerification();

      await user?.updateDisplayName(username);
      await user?.reload();
      user = auth.currentUser;

      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  static void rememberUser() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.setPersistence(Persistence.SESSION);
  }
}
