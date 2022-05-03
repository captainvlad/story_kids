import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/ui/client/screens/desktop/already_logged_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/already_logged_screen.dart';

class AlreadyLoggedScreen extends StatelessWidget {
  static String path = "already_logged";

  const AlreadyLoggedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const AlreadyLoggedScreenDesktop(),
      tablet: const AlreadyLoggedScreenMobile(),
      mobile: const AlreadyLoggedScreenMobile(),
    );
  }
}
