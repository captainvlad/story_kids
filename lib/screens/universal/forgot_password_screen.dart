import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/screens/desktop/forgot_password_screen.dart';
import 'package:story_kids/screens/mobile/forgot_password_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String path = "forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const ForgotPasswordScreenDesktop(),
      tablet: const ForgotPasswordScreenMobile(),
      mobile: const ForgotPasswordScreenMobile(),
    );
  }
}
