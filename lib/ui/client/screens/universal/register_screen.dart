import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/ui/client/screens/desktop/register_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/register_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String path = "register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const RegisterScreenDesktop(),
      tablet: const RegisterScreenMobile(),
      mobile: const RegisterScreenMobile(),
    );
  }
}
