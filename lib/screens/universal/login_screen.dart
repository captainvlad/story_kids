import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/screens/desktop/login_screen.dart';
import 'package:story_kids/screens/mobile/login_screen.dart';

class LogInScreen extends StatelessWidget {
  static String path = "log_in";

  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const LogInScreenDesktop(),
      tablet: const LogInScreenMobile(),
      mobile: const LogInScreenMobile(),
    );
  }
}
