import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/screens/desktop/already_logged.dart';
import 'package:story_kids/screens/mobile/already_logged.dart';

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
